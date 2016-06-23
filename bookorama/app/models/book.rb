class Book < ActiveRecord::Base

  belongs_to :category
  has_and_belongs_to_many :editors, :class_name => "AdminUser"

  scope :sorted, lambda { order("books.author ASC") }
  scope :newest_first, lambda { order("books.created_at DESC")  }
  scope :search, lambda { |query|
    where(["description LIKE ?", "%#{query}%"])
  }
end
