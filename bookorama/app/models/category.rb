class Category < ActiveRecord::Base

  has_many :books

  # add friendly_id
  extend FriendlyId
  friendly_id :category_name, use: :slugged


  # validation
  validates_presence_of :category_name, :slug

  # Scopes
  scope :sorted, lambda { order("categories.id ASC") }
end
