require 'factory_girl'

Factory.define :valid_user, :class => User do |u|
  u.username 'john'
  u.name  'John Lennon'
  u.email 'john_lennon@beatles.com'
  u.password 'beatles'
  u.password_confirmation 'beatles'
end

