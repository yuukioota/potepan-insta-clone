# coding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
50.times do |n|
  User.create!(
    email: "test#{n + 1}@test.com",
    name: "テスト太郎#{n + 1}",
    user_name: "ユーザー#{n + 1}",
    # image: File.open('./app/assets/images/test.jpg'),
    profile_text: "テスト#{n + 1}です。よろしくお願いします。",
    # profile_photo: open("#{Rails.root}/db/fixtures/img#{rand(1..5)}.jpg"),
    password: "#{n + 1}" * 6,
    password_confirmation: "#{n + 1}" * 6,
    confirmed_at: Time.zone.now
  )
end

User.all.each do |user|
  3.times do |n|
    user.posts.create!(
      caption: "#{n + 1}回目の投稿です。よろしくお願いします。",
    )
  end
end

150.times do |n|
  Photo.create!(
    post_id: "#{n + 1}",
    image: open("#{Rails.root}/db/fixtures/img#{rand(1..10)}.jpg")
    )
end

users = User.all
user = users.first
following = users[2..50]
followers = users[3..41]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }

