module Api::V1
  class SchedulesController < BaseController
    before_action :set_schedule, only: [:show, :update, :destroy]

    # GET /schedules
    def index
      # services_count = service_ids && service_ids.count
      distance = params[:distance] || 25
      stylists = Stylist.nearest_stylists(distance, params[:lat], params[:long])
      schedules = Schedule
                           .joins(:stylist_schedules)
                           .where(stylist_schedules: { stylist_id: stylists, available: true })
                           .distinct
      # filter by date range
      schedules = schedules.from_date(params[:from_date]) if params[:from_date]
      schedules = schedules.to_date(params[:to_date]) if params[:to_date]

      # filter by service_ids array
      schedules = schedules.reject{ |s| (s.service_ids & service_ids).empty? } if service_ids

      json_response(schedules)
    end

    # POST /schedules
    def create
      @schedule = Schedule.new(schedule_params.except(:stylist_id))
      authorize @schedule
      schedule = CreateScheduleService.new(schedule_params, stylist_id).call
      if schedule.errors.empty?
        json_response(schedule, :created)
      else
        json_response(schedule.errors.messages, :unprocessable_entity)
      end
    end

    # GET /schedules/:id
    def show
      json_response(@schedule)
    end

    # PUT /schedules/:id
    def update
      authorize @schedule
      @schedule.update(schedule_params)
      head :no_content
    end

    # DELETE /schedules/:id
    def destroy
      authorize @schedule
      @schedule.destroy
      head :no_content
    end

    def nearest_schedules
      distance = params[:distance] || 25
      stylists = Stylist.nearest_stylists(distance, params[:lat], params[:long])
      @schedules = Schedule.joins(:stylist_schedules).where(stylist_schedules: { stylist_id: stylists })
      @schedules = @schedules.filter_by_service(service_ids) if service_ids
      @schedules = @schedules.from_date(params[:from_date]) if params[:from_date]
      @schedules = @schedules.to_date(params[:to_date]) if params[:to_date]
      json_response(@schedules)
    end

    private

    def schedule_params
      params.require(:schedules).permit(:stylist_id, :date, :start_time, service_ids: [])
    end

    def set_schedule
      @schedule = Schedule.find(params[:id])
    end

    def stylist_id
      if current_user.admin?
        Stylist.where(id: schedule_params[:stylist_id])&.pluck(:id)&.first
      else
        current_user.stylist.id
      end
    end

    def service_ids
      return params[:service_ids].map(&:to_i) unless params[:service_ids].is_a? String
      JSON.parse(params[:service_ids])
    end
  end
end