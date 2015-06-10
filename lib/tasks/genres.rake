desc "Создание 17 жанров"
namespace :genres do
  task :create=>:environment do

    g1=Genre.create(id:0, name: "Роман")
    g2=Genre.create(id:1,name: "Фантастика")
    g3=Genre.create(id:2,name: "Детектив")
    g4=Genre.create(id:3,name: "Драма")
    g5=Genre.create(id:4,name: "Комедия")
    g6=Genre.create(id:5,name: "Трагедия")
    g7=Genre.create(id:6,name: "Басня")
    g8=Genre.create(id:7,name: "Былина")
    g9=Genre.create(id:8,name: "Баллада")
    g10=Genre.create(id:9,name: "Миф")
    g11=Genre.create(id:10,name: "Новелла")
    g12=Genre.create(id:11,name: "Повесть")
    g13=Genre.create(id:12,name: "Рассказ")
    g14=Genre.create(id:13,name: "Роман-эпопея")
    g15=Genre.create(id:14,name: "Сказка")
    g16=Genre.create(id:15,name: "Эпопея")
    g17=Genre.create(id:16,name: "Мистика")

  end
end
