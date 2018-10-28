# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# necessary seeds
Exercise.create_or_update_standard_exercises # needs to go first
ProgramPlan.create_or_update_featured_programs


# for Demo Use
if User.find_by(email: 'guest@guest.com').nil?
  user = User.new(name: 'Guest', email: 'guest@guest.com', password: 'pass', image: '/assets/guest.png')
  user.build_journal(name: 'Workout Journal')
  user.save
end
