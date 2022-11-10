FactoryBot.define do
  factory :tweet do
    title {Faker::Lorem.sentence}
    text {Faker::Lorem.sentence}
    hashtag {Faker::Lorem.sentence}
    association :user

    after(:build) do |tweet|
      tweet.image.attach(io: File.open('public/images/test.image.png'), filename: 'test.image.png')
    end
  end
end