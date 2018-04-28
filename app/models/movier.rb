class Movier < ApplicationRecord
   mount_uploader :movierimage, MovierimageUploader
   has_many :comments, dependent: :destroy
   belongs_to :category
end
