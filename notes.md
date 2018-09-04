website plan:
users can sign up and login
users can create, edit, and delete journal entries.
users can only view their own journals.


models structure

user, has one journal
journals- has many entries, belongs to a user
entries- has many exercises, belongs to journals
exercises - belongs to entries, has many categories
categories- has many exercises
exercises-categories- join table for exercises and categories

extras?
progress chart
goals 
