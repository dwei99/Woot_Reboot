class Review < ActiveRecord::Base
  belongs_to :item
  belongs_to :user

  validates :content, :presence => {message:["Review  cant be blank"]}

end
