FactoryGirl.define do

   #First User Factory
   factory :user_with_name, class: User do
      username "martin1234"
      email "martin1234@pendulum.com"
      name 'martin'
      password 'jackson_browning'
   end

   factory :user_without_username, class: User do
      email 'darnel@morgoth.net'
      name 'jerry darnel'
      password 'jackson_browning'
   end

   factory :user_without_password, class: User do
      username "max123"
      email "max123@perpendicular.com"
      name 'maxwell'
   end
end
