require 'factory_girl'

Factory.define :john, :class => User do |u|
  u.username 'john'
  u.name  'John Lennon'
  u.email 'john_lennon@beatles.com'
  u.password 'beatles'
  u.password_confirmation 'beatles'
end

Factory.define :paul, :class => User do |u|
  u.username 'paul'
  u.name  'Paul'
  u.email 'paul@beatles.com'
  u.password 'beatles'
  u.password_confirmation 'beatles'
end

Factory.define :list, :class => List do |l|
  l.name "Things that i need to do today"
  l.association :user, :factory => :john
end

Factory.define :public_list, :class => List do |l|
  l.name "Things that i need to do today"
  l.public true
  l.association :user, :factory => :john
end

Factory.define :completed_task, :class => Task do |t|
  t.name "Write an article"
  t.completed true
end

Factory.define :pending_task, :class => Task do |t|
  t.name "Read a book"
  t.completed false
end

Factory.define :pending_task_with_empty_name, :class => Task do |t|
  t.name nil
  t.completed false
end

