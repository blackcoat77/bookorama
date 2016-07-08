class Book < ActiveRecord::Base
    belongs_to :category
    has_and_belongs_to_many :editors, class_name: 'AdminUser'

    # add friendly_id
    extend FriendlyId
    friendly_id :title, use: :slugged

    has_attached_file :photo,
                      # styles: { small: '200x200', thumb: '100x100#', large: '600x600>', medium: '150x150>'},
                      url: '/assets/books/:id/:style/:basename.:extension',
                      path: ':rails_root/public/assets/books/:id/:style/:basename.:extension',
                      # convert_options: {:small => '-background white -gravity center -extent 200x200'},
                      styles: {
                          thumb: ['100x100#', :jpg, quality: 70],
                          small: ['200x200', :jpg, quality: 70],
                          preview: ['480x480#', :jpg, quality: 70],
                          large: ['600>', :jpg, quality: 70],
                          retina: ['1200>', :jpg, quality: 30]
                      },
                      convert_options: {
                          thumb: '-set colorspace sRGB -strip',
                          small: '-set colorspace sRGB -strip',
                          preview: '-set colorspace sRGB -strip',
                          large: '-set colorspace sRGB -strip',
                          retina: '-set colorspace sRGB -strip -sharpen 0x0.5'
                      }

    validates_attachment_presence :photo
    validates_attachment_size :photo, less_than: 5.megabytes
    validates_attachment_content_type :photo, content_type: ['image/jpeg', 'image/png', 'image/jpg']

    # TODO: other validation fields
    # validates_presence_of :title, :slug

    # validation of book fields
    validates_presence_of :isbn
    # validates_length_of :isbn, maximum: 13

    validates_presence_of :author
    # validates_length_of :author, maximum: 80

    scope :visible, -> { where(visible: true) }
    scope :invisible, -> { where(visible: false) }

    scope :sorted, -> { order('books.author ASC') }
    scope :newest_first, -> { order('books.created_at DESC') }
end
