FactoryGirl.define do
    factory :user do
      username 'joe'
      password_digest '123'
      bmi '20'
      age '23'
    end
end