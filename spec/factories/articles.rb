require 'spec_helper'

FactoryBot.define do
  factory :article do
    title   { Faker::Lorem.paragraph(3) }
    content { Faker::Company.catch_phrase }
  end
end
