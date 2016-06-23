class Category < ActiveRecord::Base

  has_many :books

  scope :sorted, lambda { order("categories.id ASC") }
end
