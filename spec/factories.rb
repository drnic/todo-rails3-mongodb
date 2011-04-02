require 'factory_girl'

Factory.define :user, :class => User do |u|
  u.username 'john'
  u.name  'John Lennon'
  u.email 'john_lennon@beatles.com'
  u.password 'beatles'
  u.password_confirmation 'beatles'
end

Factory.define :test_user, :class => User do |u|
  u.username 'test'
  u.name  'Test'
  u.email 'test@test.com'
  u.password 'test123'
  u.password_confirmation 'test123'
end

Factory.define :list, :class => List do |l|
  l.name "Things that i need to do today"
  l.association :user, :factory => :user
end

Factory.define :public_list, :class => List do |l|
  l.name "Things that i need to do today"
  l.public true
  l.association :user, :factory => :user
end

Factory.define :task, :class => Task do |t|
  t.name "Write an article"
end

