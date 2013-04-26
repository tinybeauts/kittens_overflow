FactoryGirl.define do |variable|
  factory :user do
    sequence(:username) { |n| "foo_#{n}" }
    email { "#{username}@email.com" }
    password "foobar"
  end

  factory :image do
    source_url "http://example.com/image.jpg"
    owner "Andy"
  end

  factory :story do
    body "Lorem Ipsum COlor Dolor Sit Amet"
    user
    image
  end

  factory :image_vote, :class => 'Vote' do
    user
    association :votable, :factory => :image
  end

  factory :story_vote, :class => 'Vote' do
    user
    association :votable, :factory => :story
  end

end

