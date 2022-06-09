module DunnasSeo
  class Seo < ApplicationRecord
    include Searchrable

    mount_uploader :photo_about, DunnasSeo::PhotoUploader

    scope :ordered, -> { order(created_at: :desc) }
  end
end
