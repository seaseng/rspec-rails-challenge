require 'spec_helper'

FactoryGirl.define  do

  # sequence :email do |n|
  #   "person#{n}@example.com"
  # end
  factory :user do
    sequence(:email) {|n| "person#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
  end

  factory :post do
    # title "title" # instead of FactoryGirl.generate(:random_string)
    # content "content"
    sequence(:title) {|n| "title#{n}" }
    sequence(:content) {|n| "content#{n}" }
    association :user
  end
end