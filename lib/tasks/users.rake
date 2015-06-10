desc "Создание 2 пользователей с разными правами"
namespace :users do
  task :create=>:environment do

    us1=User.create(name: "Admin",
                    phone: "+79232345678",
                    email: "admin@admin.ru",
                    password: "i_am_god",
                    address: "Avtozavodskaya",
                    role: 1)
    us2=User.create(name: "Администратор",
                    phone: "+79222345678",
                    email: "1@1.ru",
                    password: "1234567",
                    address: "Avtozavodskaya",
                    role: 1)
    us3=User.create(name: "Пользователь",
                    phone: "+79212345678",
                    email: "00@0.ru",
                    password: "1234567",
                    address: "Avtozavodskaya",
                    role: 0)

  end
end


