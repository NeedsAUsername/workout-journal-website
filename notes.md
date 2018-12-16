next to do:


  sort exercises in routine by order. (add an order number to database?)
  let users change the order of routines and exercises



extras?
progress chart
goals


HEROKU NOTES
$ heroku run rake db:task_name
examples:
to migrate:
$ heroku run rake db:migrate
to seed:
$ heroku run rake db:seed
to console:
$ heroku run rails console

to add heroku remote to current repo:
$ git remote add heroku git@heroku.com:workout-programs-journal.git

After migrations:
$ heroku restart
