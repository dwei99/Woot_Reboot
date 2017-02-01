class Category < ActiveRecord::Base
  belongs_to :item

  has_many :items
end
