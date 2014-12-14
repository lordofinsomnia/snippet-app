FactoryGirl.define do
	factory :user do
		sequence(:email) { |n| "foo12213111a1aa#{n}@mail.com" }
		password "password"
	end
end