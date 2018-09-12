class Exercise < ApplicationRecord
  has_many :exercise_program_plans
  has_many :program_plans, through: :exercise_program_plans
  has_many :links

  validates :name, :presence => true

  def self.create_standard_exercises
    self.standard_exercise_attributes.each do |lift_attributes|
      if exercise = Exercise.find_by(name: lift_attributes[:exercise_attributes][:name])
        exercise.update(lift_attributes[:exercise_attributes])
        destroy_objects(exercise.links)
      else
        exercise = Exercise.create(lift_attributes[:exercise_attributes])
      end
      exercise.links.build(lift_attributes[:exercise_links])
      exercise.save
    end
  end

  # add new standard exercises to this array to display them.
  private

  def self.standard_exercise_attributes
    [self.bench_press, self.overhead_press]
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

end
