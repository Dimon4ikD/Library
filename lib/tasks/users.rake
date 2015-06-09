desc "Создание 2 пользователей с разными правами"
namespace :users do
  task :create=>:environment do
    us1=User.create(name: "Admin",
                    phone: "+79232345678",
                    email: "admin@admin.ru",
                    password: "i_am_god",
                    address: "Avtozavodskaya",
                    role: 1)
    us2=User.create(name: "Angel",
                    phone: "+79222345678",
                    email: "moderator@angel.ru",
                    password: "i_am_angel",
                    address: "Avtozavodskaya",
                    role: 1)
    us3=User.create(name: "Simple",
                    phone: "+79212345678",
                    email: "user@simple.ru",
                    password: "i_am_simple",
                    address: "Avtozavodskaya",
                    role: 0)
  end
end


