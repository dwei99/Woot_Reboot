class Cart < ActiveRecord::Base
  has_many :cart_items
  has_many :items, :through => :cart_items

  def get_total

  end

end
