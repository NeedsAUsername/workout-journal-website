next to do:

  connect the days/routine to the entry form such that the weights are defaulted to the last time the exercise was done.

  let users create routines in custom program.
  let users edit routines

  sort routines by order. (add an order number to database?)
  sort exercises in routine by order. (add an order number to database?)
  let users change the order of routines and exercises


javascript to research and incorporate:
- modals
- rollover



extras?
progress chart
goals



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
$ heroku run rake db:task_name
examples:
to migrate:
$ heroku run rake db:migrate
to seed:
$ heroku run rake db:seed

After migrations:
$ heroku restart
