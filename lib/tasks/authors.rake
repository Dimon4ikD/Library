desc "Генерация 3 авторов"
namespace :authors do
  task create: :environment do
    # 3.times do |i|
    #   b = Author.new(name: "Автор #{i+1}", birthday: "0#{i}.0#{i+1}.200#{i}")
    #   b.save
    # end
    # File.join(Rails.root, "app/assets/images/infos/stock/#{info_name}")
    # avatar_url=img.attr('src') if img
    # File.new("#{Rails.root}/path/to/somefile.jpg"),         File.new("#{Rails.root}/path/to/somefile.jpg"),
    a1=Author.create(id:0,name: "Михаил Сергеевич Писатель", birthday:"06.06.1990", :avatar=>File.new("#{Rails.root}/app/assets/images/blank_man1.png"))
    a2=Author.create(id:1, name: "Александр Сергеевич Пушки", birthday:"06.06.1799", :avatar=>File.new("#{Rails.root}/app/assets/images/pushkin.jpg"))
    a3=Author.create(id:2,name: "Сергей Александрович Есенин", birthday:"03.11.1895", :avatar=>File.new("#{Rails.root}/app/assets/images/esenin.jpg"))
    a4=Author.create(id:3,name: "Михаил Юрьевич Лермонтов", birthday:"15.10.1814", :avatar=>File.new("#{Rails.root}/app/assets/images/lermontov.jpg"))
  end
end
