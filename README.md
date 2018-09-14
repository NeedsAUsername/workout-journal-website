# README

#Project title
Workout Journal Website

#Motivation
For the past few years, I have tracked my workouts in notebooks and on excel spreadsheets. Since I'm learning to code, why not build a site that I could use myself? There are many websites and apps out there for workout logging, and many sites that have information on different workout programs and routines, but mine aims to do both: to be a place to find information on programs, and to conveniently set your journal to follow a program that you like!

#Build Status
Under development

#Features
A programs page that features some workout programs that I have used over the years, and which I believe have stood the test of time as effective routines for building strength.

#Setting Up
To set up standard exercises(which will show by default when users create a custom program)
  - go to app/models/exercises
  - define a method with the exercise's attributes, and insert it into the method self.standard_exercise_attributes
  - in the console, run Exercise.create_or_update_standard_exercises

To set up featured programs(which will show up on the programs page for all users)
  - make sure you have set up all the standard exercises that are in the featured programs.
  - go to app/models/program_plans
  - in the console, run ProgramPlan.create_or_update_featured_programs

If you want to edit the standard exercises or featured programs, simply change the attributes and run the create_or_update method again. Alternatively, use rake:seed to do both at the same time.

#Testing
run rspec

If you decide/change the standard exercises or featured programs that I have currently, you will need to change the test specs since they are dependent on them.


#License
MIT
