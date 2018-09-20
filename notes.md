next to do:
  use the cocoon gem to make the exercises on the entry form able to be added/removed.

extras?
progress chart
goals

to do?
homepage(users/show) shows user name, stats, other info. has link to journal, programs.
fix 'Program Plan Index And Show Pages user edits their current program' test


journal index page

 list of unique workout days for the user's program. will default to the next one in the order. Users can change the order of the workouts.

workout a  workout b  workout c

today is workout a, next is workout b
 when a user clicks on the workout it becomes today's workout, changing the next workout as the next one.
  -> today is workout b, next is workout c

 data that will change according to today's workout
exercise 1 weight: default to the last entry
exercise 2 weight: default to the last entry
date : today
Complete this workout -> submits data into journal history



HEROKU NOTES
to migrate:
$ heroku run rake db:migrate
to seed:
$ heroku run rake db:seed
