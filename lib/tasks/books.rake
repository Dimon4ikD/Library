desc "Генерация 100 книг"
namespace :books do
  task create: :environment do
    100.times do |i|
      b = Book.new()
      b.description = "Lorem ipsum dolor sit amet, consectetur adipisicing elit. In "
    end
  end
end