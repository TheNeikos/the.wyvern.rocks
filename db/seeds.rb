# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def role name
  Role.find_or_create_by name: name
end

Category.find_or_create_by(name: "General")

cat = Category.find_or_create_by(name: "Admin Area")
cat.roles << role("Admin")
cat.save
