desc "Генерация 3 авторов"
namespace :authors do
  task create: :environment do
    3.times do |i|
      b = Author.new(name: "Автор #{i+1}", birthday: "0#{i}.0#{i+1}.200#{i}")
      b.save
    end
  end
end
