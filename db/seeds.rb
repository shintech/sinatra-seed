users = [
  {name: 'test'},
  {name: 'test2'}
]

users.each do |u|
  User.create(u)
end
