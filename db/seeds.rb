# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name: "admin",
             email: "admin@gmail.com",
             password: "123456",
             password_confirmation: "123456")
15.times do
  name = Faker::Name.title
  cate = Category.create! name: name

  10.times do
    word = Category.all.sample.words.build name: Faker::Lorem.word
    word.answers = [
      Answer.new(content: Faker::Lorem.word, is_correct: true),
      Answer.new(content: Faker::Lorem.word, is_correct: false),
      Answer.new(content: Faker::Lorem.word, is_correct: false),
      Answer.new(content: Faker::Lorem.word, is_correct: false)
    ].shuffle
    word.save!
  end
end
