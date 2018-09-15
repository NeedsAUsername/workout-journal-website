
extras?
progress chart
goals

to do?
homepage(users/show) shows user name, stats, other info. has link to journal, programs.



current issue: actually, since I wrote so much, this could turn into a blog post.
I don't want users to edit standard exercises (for good reasons). However, when users create their program, they have the checkbox to include standard exercises, therefore including them into the program. However, as the website develops, I want to use the weight attribute for exercises and that is not compatible with standard exercises (because of course changes will apply to all users with that exercise as well as the feature programs). I also cannot proceed with users adopting featured programs because of this reason, as their changes to it will apply to everyone.

possible solutions?
create duplicates of standard exercises and duplicates of featured programs then turn the featured/standard attribute to false. This way, users can edit them however they want, and it will not affect other user's programs/exercises, or the featured programs/standard exercises, and I can fully use the jquery + cocoon nested forms features. This may be hard to implement for the standard exercise checkbox on the program creation page since they are directly connected to the standard exercises. I could duplicate all the standard exercises and have that be the data in the checkboxes, but the checkbox value is still the ID, meaning I would need to create all the duplicates on every creation page refresh, and that would create a lot of unnecessary data for the database. Another idea is, instead of the checkbox value being ID, maybe pass in attributes and create a new exercise with those attributes? Can I pass in the object itself, then duplicate it?
Another idea could be to scrap the idea of the exercise having weights in the first place. Instead, I could have the journal track the weights instead, perhaps using the last entry's data. That way, I don't have to worry about duplication, and can keep the standard exercises attached to the user since users won't be making attribute changes to them. What to do??

I also really don't want to make changes to my long generation methods/the way standard exericses and featured programs are currently structured! Ideally, changes must be on the user side!


journal index page

 list of unique workout days for the user's program. will default to the next one in the order. Users can change the order of the workouts.

workout a  workout b  workout c

today is workout a, next is workout b
 when a user clicks on the workout it becomes today's workout, changing the next workout as the next one.
  -> today is workout b, next is workout c

 data that will change according to today's workout
exercise 1 weight: default to the last entry
exericse 2 weight: default to the last entry
date : today
Complete this workout -> submits data into journal history
