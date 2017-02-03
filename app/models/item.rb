class Item < ActiveRecord::Base
  belongs_to :category

  validates :name, :presence => {message:["Product name cant be blank"]}
  validates :description, :presence => {message:["Description name cant be blank"]}
  validates :price, :presence => {message:["Price cant be blank"]}
  validates :quantity, :presence => {message:["Quantity cant be blank"]}
  validates :category, :presence => {message:["Category cant be blank"]}

  has_many :discussions
  # ratyrate_rateable "rating"

end
