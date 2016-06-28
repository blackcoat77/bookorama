class AdminUser < ActiveRecord::Base

    has_secure_password

    has_and_belongs_to_many :books

    scope :sorted, lambda { order('last_name ASC, first_name ASC') }

    # Add user avatars
    has_attached_file :photo,
                      styles: { small: '300x300>', thumb: '100x100#' },
                      url: '/assets/admin_user/:id/:style/:basename.:extension',
                      path: ':rails_root/public/assets/admin_user/:id/:style/:basename.:extension'

    validates_attachment_presence :photo
    validates_attachment_size :photo, less_than: 5.megabytes
    validates_attachment_content_type :photo, content_type: ['image/jpeg', 'image/png', 'image/jpg']

    # VALIDATION
    EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i
    FORBIDDEN_USERNAMES = ['littlebopeep','humptydumpty','marymary']

    validates :first_name, presence: true,
                           length: { maximum: 25 }
    validates :last_name, presence: true,
                          length: { maximum: 50 }
    validates :username, length: { within: 8..25 },
                         uniqueness: true
    validates :email, presence: true,
                      length: { maximum: 100 },
                      format: EMAIL_REGEX,
                      confirmation: true

    def name
        "#{first_name} #{last_name}"
    end

    def username_is_allowed
        if FORBIDDEN_USERNAMES.include?(username)
            errors.add(:username, 'has been restricted from use.')
        end
    end
end
