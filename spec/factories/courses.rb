# frozen_string_literal: true

FactoryBot.define do
  factory :course do
    name { 'Introduction to Ruby' }
    description { 'A beginner course on Ruby programming.' }
    sequence(:code) { |n| "TUTOR#{n}#{Faker::Number.number(digits: 4)}" }
  end
end
