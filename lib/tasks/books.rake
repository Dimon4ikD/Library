desc "Генерация 20 книг"
namespace :books do
  task create: :environment do
    20.times do |i|
      b = Book.new(name: "Книга #{i+1}", price: rand(1.0E6)/100.0+1, author: ("Lorem Ipsum"))
      b.description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In dignissim nunc ac lectus elementum, vitae viverra eros tempor. Sed quis turpis dignissim, lobortis nisi non, sodales sapien. Suspendisse libero lectus, rutrum in tellus vel, pretium bibendum lacus. Curabitur malesuada mauris et tellus congue scelerisque. Sed diam metus, accumsan eu lacus convallis, ullamcorper condimentum diam. Aenean non nibh lorem. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Donec ut orci sed justo aliquet tempus in non velit. Duis eu congue justo, non pellentesque ante. Proin in hendrerit lorem. Vivamus malesuada tortor diam, ac tincidunt urna porttitor vel. Vestibulum in nunc vitae orci ultricies congue"
      b.save
    end
  end
end
