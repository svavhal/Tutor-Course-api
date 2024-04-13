# frozen_string_literal: true

FactoryBot.define do
  factory :tutor do
    association :course
    name { Faker::Name.name }
    email { Faker::Internet.email }
    bio { 'Experienced tutor in computer science.' }
  end
end
