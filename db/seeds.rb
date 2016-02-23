# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# provides a superadmin user
User.create(name: 'superadmin', password: 'changeme', password_confirmation: 'changeme', admin: true)

# provides usual names for categories of userstories
userstory_categories = %w(bug chore feature)
userstory_categories.each do |cat|
  Category.create name: cat
end

