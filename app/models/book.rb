class Book < ApplicationRecord
  has_one_attached :image
  belongs_to :user

   validates :name, presence: true
   validates :email, presence: true
   validates :password, presence: true

end
