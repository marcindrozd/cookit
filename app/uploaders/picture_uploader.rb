class PictureUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  process :tags => ['cookbook_picture']

  cloudinary_transformation :transformation => [{:width => 600, :height => 600, :crop => :limit}]
end
