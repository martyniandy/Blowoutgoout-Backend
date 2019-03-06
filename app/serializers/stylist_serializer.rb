class StylistSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :description, :phone,
             :lat, :long, :image

  def image
    # Rails.application.routes.url_helpers.rails_blob_path(object.image)
    Rails.application.routes.url_helpers.rails_representation_url(object.image.variant(resize: "100x100").processed)
    # object.image.variant(resize: "100x100").processed.service_url
    # Rails.application.routes.url_helpers.rails_blob_path(object.image.variant(resize: "100x100"))
  end
end