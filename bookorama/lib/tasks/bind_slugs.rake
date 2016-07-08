task :bind_slugs => :environment do
  require 'rake'

  Category.find_each(&:save)
  Book.find_each(&:save)
end
