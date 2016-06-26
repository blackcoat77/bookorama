class Category < ActiveRecord::Base

  has_many :books


  # validation
  validates_presence_of :category_name

  # Scopes
  scope :sorted, lambda { order("categories.id ASC") }
end
