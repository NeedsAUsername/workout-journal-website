class Exercise < ApplicationRecord
  has_many :exercise_program_plans
  has_many :program_plans, through: :exercise_program_plans
  has_many :links

  validates :name, :presence => true

  def self.create_or_update_standard_exercises
    self.standard_exercise_attributes.each do |lift|
      if exercise = Exercise.find_by(name: lift[:exercise_attributes][:name], standard: true)
        exercise.update(lift[:exercise_attributes])
        destroy_objects(exercise.links)
      else
        exercise = Exercise.create(lift[:exercise_attributes])
      end
      exercise.links.build(lift[:exercise_links])
      exercise.save
    end
  end

  # add new standard exercises to this array to display them.
  private

  def self.standard_exercise_attributes
    [bench_press, overhead_press, squat, deadlift, row, chin_up]
  end

  def self.bench_press
    {
      exercise_attributes: {
        name: 'Bench Press',
        description: 'Works the chest, arms, and shoulder muscles.',
        standard: true # needed to be added to featured program_plans
      },
      exercise_links:[
        {
          name: 'https://stronglifts.com/bench-press/',
          description: 'Detailed guide on how to perform a proper bench press',
        }
      ]
    }
  end

  def self.overhead_press
    {
      exercise_attributes: {
      name: 'Overhead Press',
      description: 'Works primarily the shoulders.',
      standard: true
    },
      exercise_links: [
        {
        name: 'https://stronglifts.com/overhead-press/',
        description: 'Detailed guide on how to perform a proper overhead press'
        }
      ]
    }
  end

  def self.squat
    {
      exercise_attributes: {
      name: 'Squat',
      description: "Works the leg muscles. Don't skip leg day.",
      standard: true
    },
      exercise_links: [
        {
        name: 'https://stronglifts.com/squat/',
        description: 'Detailed guide on how to perform a proper squat'
        }
      ]
    }
  end

  def self.deadlift
    {
      exercise_attributes: {
      name: 'Deadlift',
      description: 'The king of lifts.',
      standard: true
    },
      exercise_links: [
        {
        name: 'https://stronglifts.com/deadlift/',
        description: 'Detailed guide on how to perform a proper deadlift'
        }
      ]
    }
  end

  def self.row
    {
      exercise_attributes: {
      name: 'Row',
      description: 'Works the back muscles.',
      standard: true
    },
      exercise_links: [
        {
        name: 'https://stronglifts.com/barbell-row/',
        description: 'Detailed guide on how to perform a proper row'
        }
      ]
    }
  end

  def self.chin_up
    {
      exercise_attributes: {
        name: 'Chin-up',
        description: 'Amazing upper body exercise.',
        standard: true
      },
      exercise_links:[
        {
          name: 'https://www.youtube.com/watch?v=mRznU6pzez0',
          description: 'Youtube video on how to perform a proper chin-up',
        }
      ]
    }
  end

end
