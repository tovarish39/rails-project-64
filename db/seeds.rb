# frozen_string_literal: true

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

########### заполнение из демонстрационного проекта
# создание категорий, юзера, его постов, лайк, комменты
%w[Кино Музыка].each do |category|
  Category.create(name: category)
end
categories = Category.all

user = User.create(
  email: Faker::Internet.email,
  password: 'secret_password',
  password_confirmation: 'secret_password'
)

posts = [
  { title: 'Что такое криптография?',
    body: 'Это может быть не очевидно, но мы сталкиваемся с криптографией каждый день. Например, когда мы оплачиваем
      покупки картой, смотрим видео на YouTube или заправляем машину, криптография защищает нашу информацию. Может
      показаться, что криптография – это удел разработчиков, хакеров и корпораций, а простому пользователю знать о ней
      вовсе не обязательно. Однако это полезно не только узким специалистам, но и всем, кто заботится о собственной
      безопасности. Этот гайд поможет разобраться, что такое криптография и какое применение она находит в повседневной
      жизни.',
    category: categories.sample },

  { title: 'Что такое динамическое программирование',
    body: 'Работу разработчика часто можно сравнить с решением головоломок. Как в настоящей головоломке, разработчику
      приходится тратить существенные ресурсы не столько на реализацию конкретного решения, сколько на выбор
      оптимального подхода. Иногда задача решается легко и эффективно, а порой — только полным перебором всех возможных
      вариантов. Такой подход часто называют наивным решением. Он имеет существенный минус — временные затраты.
      \n Представим хакера, который пытается взломать какой-то пароль перебором всех комбинаций символов. Если пароль
      допускает 10 цифр, 26 маленьких букв, 26 больших букв и 32 специальных символа (например, значок доллара), то для
      каждого символа в пароле есть 94 кандидата. Значит, чтобы взломать перебором пароль, состоящий из одного символа,
      потребуется 94 проверки. Если в пароле два символа — 94 кандидата на первую позицию, 94 кандидата на вторую
      позицию — то придется перебрать аж 94*94 = 8836 возможных пар. Для пароля из десяти символов потребуется уже
      перебор 94^10 комбинаций.',
    category: categories.sample }

]

5.times do
  posts.each do |post|
    user.posts.create(
      title: post[:title],
      body: post[:body],
      category: categories.sample
    )
  end
end
post_first = Post.first

post_first.likes.create(user:)

comment = post_first.comments.create(content: 'тестовый комментарий', user:)
post_first.comments.create(content: 'тестовый комментарий вложенный', user:, parent: comment)
