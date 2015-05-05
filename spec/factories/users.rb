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

   factory :user_pass_short, class: User do
      username "max123"
      email "max123@perpendicular.com"
      name 'maxwell'
      password 'large'
   end

   factory :user_pass_shortnum, class: User do
      username "max123"
      email "max123@perpendicular.com"
      name 'maxwell'
      password 'large6'
   end

   factory :user_pass_nonum, class: User do
      username "max123"
      email "max123@perpendicular.com"
      name 'maxwell'
      password 'largearrest'
   end

   factory :user_perfect, class: User do
      username "bfranks22"
      email "barneyfrank@frank.ly"
      name "Frank_Barney"
      password 'barrybonds7'
   end
end
