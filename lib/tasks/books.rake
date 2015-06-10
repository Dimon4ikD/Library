puts "======Генерация книг======"
desc "Генерация 4 книг"
namespace :books do
  task create: :environment do
    20.times do |i|
      b = Book.new(id: "#{i+10}",name: "Книга #{i+5}", price: rand(1.0E6)/100.0+1, genre_id: rand(10), author_id: rand(2), amount: "2#{i}", year: "02.01.19#{i+10}")
      puts b.inspect
      # b.image=open("./app/assets/image/cover1.jpg")
      b.pages_amount = "1#{rand(600)}"
      b.lbc = "34#{rand(20)}32#{i+5}"
      b.isbn = "2#{i}4#{rand(20)}32#{i+5}"
      b.udc = "2#{rand(20)}32#{i}"
      puts "Вторая проба!===========>"
      puts b.inspect
      b.description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In dignissim nunc ac lectus elementum, vitae viverra eros tempor. Sed quis turpis dignissim, lobortis nisi non, sodales sapien. Suspendisse libero lectus, rutrum in tellus vel, pretium bibendum lacus. Curabitur malesuada mauris et tellus congue scelerisque. Sed diam metus, accumsan eu lacus convallis, ullamcorper condimentum diam. Aenean non nibh lorem. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Donec ut orci sed justo aliquet tempus in non velit. Duis eu congue justo, non pellentesque ante. Proin in hendrerit lorem. Vivamus malesuada tortor diam, ac tincidunt urna porttitor vel. Vestibulum in nunc vitae orci ultricies congue"
      b.save

    end
  end
end

