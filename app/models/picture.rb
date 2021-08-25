class Picture < ApplicationRecord
    mount_uploaer :image, ImageUploader 
end
