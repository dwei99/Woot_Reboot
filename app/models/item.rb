class Item < ActiveRecord::Base
  belongs_to :category

  has_many :discussions
  ratyrate_rateable "rating"

end
