namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    require "populator"
    require "faker"


    [Category, Book].each(&:delete_all)

    Category.populate 6 do |category|

      category.category_name = Faker::Book.genre
      category.visible =  Faker::Boolean.boolean

      Book.populate 32 do |book|
        book.category_id = category.id
        book.isbn = Faker::Code.isbn
        book.title = Faker::Book.title
        book.author = Faker::Book.author
        book.description = Populator.sentences(1)
        book.price = [4.99, 19.95, 23.22, 15.11, 13.18, 33.45]
        book.visible = Faker::Boolean.boolean


      end

    end

# seed images from samplimages folder
Book.all.each { |book| book.photo = File.open(Dir.glob(File.join(Rails.root, 'sampleimages', '*')).sample); book.save! }

  end
end
