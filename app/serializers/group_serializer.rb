class GroupSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :name, :description, :title, :rating, :image
  has_many :reservations
  def image
    return unless object.image.attached?

    {
      url: rails_blob_url(object.image, only_path: true)
    }
  end
end
