book = Book.create( :isbn => '0672329166', :author => 'Luke Welling and Laura Thomson', :title => 'PHP and MySQL Web Development', :price =>'49.99', :description => 'PHP & MySQL Web Development teaches the reader to develop dynamic, secure e-commerce web sites. You will learn to integrate and implement these technologies by following real-world examples and working sample projects.')
book = Book.create( :isbn => '067232976X', :author => 'Julie Meloni', :title => 'Sams Teach Yourself PHP, MySQL and Apache All-in-One', :price =>'30.99', :description => 'Using a straightforward, step-by-step approach, each lesson in this book builds on the previous ones, enabling you to learn the essentials of PHP scripting, MySQL databases, and the Apache web server from the ground up.')


first_book = Book.new(:isbn => '0672329166', :author => 'Luke Welling and Laura Thomson', :title => 'PHP and MySQL Web Development', :pri
ce =>'49.99', :description => 'PHP & MySQL Web Development teaches the reader to develop dynamic, secure e-commerce web sites. You will learn to integrate
 and implement these technologies by following real-world examples and working sample projects.')

 second_book = Book.new(:category_id => "2",:isbn => "675-444-888", :author => "Kimi Walles", :title => "Space invadors", :price => "77.98
 ", :description => "Some des")

 third_book = Book.new(:isbn => "675-444-666", :author => "Jack Alles", :title => "Space invadors 3", :price => "17.98", :description => "
 Some des")


me = AdminUser.create(:first_name => "Miroslav", :last_name => "Sreckovic", :username => "miro")
