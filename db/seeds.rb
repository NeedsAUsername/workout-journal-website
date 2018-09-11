# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.create(name: "user", email: "test@test.com", password: "pass")
user.build_journal(name: "Journal")
user.journal.entries.build(date: "2018/07/07", comments: "Nice!")
user.save

ProgramPlan.create_or_update_featured_programs  # necessary for featured programs to show on program index page
