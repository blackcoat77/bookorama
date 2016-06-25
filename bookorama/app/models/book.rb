class Book < ActiveRecord::Base
    belongs_to :category
    has_and_belongs_to_many :editors, class_name: 'AdminUser'

    has_attached_file :photo,
                      styles: { small: '300x300>', thumb: '100x100#', large: '600x600>' },
                      url: '/assets/books/:id/:style/:basename.:extension',
                      path: ':rails_root/public/assets/books/:id/:style/:basename.:extension'

    validates_attachment_presence :photo
    validates_attachment_size :photo, less_than: 5.megabytes
    validates_attachment_content_type :photo, content_type: ['image/jpeg', 'image/png', 'image/jpg']

    # TODO other validation fields
    # validation of book fields
    validates_presence_of :isbn
    validates_length_of :isbn, maximum: 13

    validates_presence_of :author
    validates_length_of :author, maximum: 80

    scope :sorted, lambda { order('books.author ASC') }
    scope :newest_first, lambda { order('books.created_at DESC') }
    scope :search, lambda { |query|
        where(['description LIKE ?', "%#{query}%"])
    }
end
