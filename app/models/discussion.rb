class Discussion < ActiveRecord::Base
  belongs_to :item
  belongs_to :user

  validates :content, :presence => {message:["content cant be blank"]}
end
