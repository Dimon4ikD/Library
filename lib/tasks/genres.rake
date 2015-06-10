desc "Создание 3 жанров"
namespace :genres do
  task :create=>:environment do

    g1=Genre.create(name: "Роман")
    g2=Genre.create(name: "Фантастика")
    g3=Genre.create(name: "Детектив")
    g4=Genre.create(name: "Драма")
    g5=Genre.create(name: "Комедия")
    g6=Genre.create(name: "Трагедия")
    g7=Genre.create(name: "Басня")
    g8=Genre.create(name: "былина")
    g9=Genre.create(name: "баллада")
    g10=Genre.create(name: "миф")
    g11=Genre.create(name: "новелла")
    g12=Genre.create(name: "повесть")
    g13=Genre.create(name: "рассказ")
    g14=Genre.create(name: "роман-эпопея")
    g15=Genre.create(name: "сказка")
    g16=Genre.create(name: "эпопея")
  end
end
