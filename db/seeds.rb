# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Photographer.create(
  first_name: "Matt",
  last_name: "O'Connell",
  email: "matthew.j.oconnell1@gmail.com",
  password: "testtest",
  password_confirmation: "testtest",
  admin: true
)

Photographer.create(
  first_name: "Leah",
  last_name: "O'Connell",
  email: "leah.g.oconnell@gmail.com",
  password: "testtest",
  password_confirmation: "testtest",
  admin: true
)

User.create(
  first_name: "Matt",
  last_name: "O'Connell",
  email: "matthew.j.oconnell1@gmail.com",
  password: "testtest",
  password_confirmation: "testtest",
)

15.times do
	User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "12345678",
    password_confirmation: "12345678"
	)
end

15.times do
  Post.create(
    photographer_id: 1,
    title: Faker::Lorem.sentence,
    description: Faker::Lorem.sentences(sentence_count = 4).join,
    body: Faker::Lorem.paragraphs(paragraph_count = 5, supplemental = false).join,
    cover_image: File.open(Dir.glob(File.join(Rails.root, 'sample_imgs', '*')).sample)
  )
end

@tags = ["fun", "awesome", "family", "how-to"]
@tags.each do |tag_name|
  Tag.create(name: tag_name)
end

Post.all.each do |post|
  3.times do
  	post.comments.create(
      name: Faker::Name.first_name,
      body: Faker::Lorem.sentences(sentence_count = 2).join
  	)
    post.tags << Tag.all.sample
  end
end