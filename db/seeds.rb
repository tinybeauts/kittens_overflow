30.times do
  User.create(username: Faker::Name.first_name, email: Faker::Internet.email, password: '123', password_confirmation: '123')
end


images = Instagram.retrieve_popular_images

images.each do |i|
  Image.create(source_url: i)
end

images = Image.all

50.times do
  image = images.sample
  story = image.stories.build(body: Faker::Lorem.paragraphs.join('</p><p>'))
  story.user = User.all.sample
  story.save
end





# http://farm8.staticflickr.com/7144/6650761689_61cd51b81e_b.jpg 
#             http://farm6.staticflickr.com/5307/5625294913_5f393d2e12_b.jpg
#             http://farm6.staticflickr.com/5149/5625883684_d7bf0f9a35_b.jpg
#             http://farm5.staticflickr.com/4024/4295085968_2da3782d3a_b.jpg
#             http://farm6.staticflickr.com/5132/5457293193_75f33993d3_b.jpg
#             http://farm6.staticflickr.com/5140/5401137345_4e5318b8ce_b.jpg
#             http://farm5.staticflickr.com/4104/5182182169_c01d38092c_b.jpg
#             http://farm2.staticflickr.com/1115/5103119532_bb9f081ba2_b.jpg
