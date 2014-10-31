Factory.define :club do |f|
  f.title   "Club no %d"
  f.address "Clubroad %d"
end

Factory.define :user do |f|
  f.first_name "Hannah"
  f.last_name  "McKay"
  f.email      "hannah_mckay@murderers.com"
  f.birthday   Date.new(1982, 7, 30)
  f.club       Factory(:club)
  f.password   "password"
end

Factory.define :member, parent: :user do |f|
  f.owner false
end

Factory.define :owner, parent: :user do |f|
  f.owner true
end
