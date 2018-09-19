class ProgramPlan < ApplicationRecord
  belongs_to :user
  has_many :exercise_program_plans
  has_many :exercises, through: :exercise_program_plans
  has_many :links
  has_many :days
  accepts_nested_attributes_for :exercises, reject_if: :all_blank, allow_destroy: :true

  after_initialize :set_defaults, unless: :persisted?

  validates :name, :presence => true

  def dup_exercise_ids=(array_of_ids)
    array_of_ids.each do |id|
      if id != ""
        @exercise = Exercise.find(id)
        @dup_exercise = @exercise.dup
        @dup_exercise.standard = nil
        self.exercises << @dup_exercise
      end
    end
  end

  def dup_exercise_ids
    @exercises
  end

  # featured programs will be shown on the program index page for the user to browse and choose. The featured boolean is there
  # so that other user's created programs do not show up on everybody's program index page.

  # use this method in seeds to quickly create the featured programs.
  # In db/seeds: ProgramPlan.create_or_update_featured_programs after Exercise.create_or_update_standard_exercises

  def self.create_or_update_featured_programs
    self.featured_program_plan_attributes.each_with_index do |plan_attributes, index|
      if user = User.find_by(email: "admin#{index}@admin.com")
        if user.program_plan.nil?
          user.build_program_plan(plan_attributes[:program_attributes])
        else
          user.program_plan.update(plan_attributes[:program_attributes])
          destroy_objects(user.program_plan.links)
          user.program_plan.exercises.clear
          user.program_plan.days.clear
        end
      else
        user = User.create(email: "admin#{index}@admin.com", name: 'admin', password: 'pass')
        user.build_program_plan(plan_attributes[:program_attributes])
      end
      
      user.program_plan.links.build(plan_attributes[:program_links])
      add_standard_exercises_using_name(user.program_plan, plan_attributes[:exercises])

      plan_attributes[:days].each do |day|
        created_day = user.program_plan.days.build(name: day[:name])
        add_standard_exercises_using_name(created_day, day[:exercises])
      end

      user.program_plan.save
      user.save
    end
  end

  private

  # add any new featured program attributes to this array
  def self.featured_program_plan_attributes
    [starting_strength, strong_lifts, boring_but_big, greyskull]
  end

  def self.starting_strength
    {
      program_attributes: {
      name: 'Starting Strength',
      description: 'A 3x5 squat-focused training system that focuses on building a foundation of strength with full-body workouts that utilize compound lifts.',
      featured: true # needed to be added to featured_programs
      },
      program_links: [
        {
        name: 'https://startingstrength.com/get-started/programs',
        description: 'visit their official site for more info'
        }
      ],
      exercises: [
        'Squat', 'Bench Press', 'Overhead Press', 'Deadlift'
      ],
      days: [
        {
          name: 1,
          exercises: ['Squat', 'Bench Press', 'Deadlift']
        },
        {
          name: 2,
          exercises: ['Squat', 'Overhead Press', 'Deadlift']
        }
      ]
    }
  end

  def self.strong_lifts
    {
      program_attributes:  {
          name: 'Strong Lifts',
          description: 'A simple but effective 5x5 squat-focused training routine for building strength.',
          featured: true
      },
      program_links: [
        {
        name: 'https://stronglifts.com/5x5/',
        description: 'Visit their official site for more info'
        }
      ],
      exercises: [
        'Squat', 'Bench Press', 'Overhead Press', 'Deadlift', 'Row'
      ],
      days: [
        {
          name: 1,
          exercises: ['Squat', 'Bench Press', 'Deadlift']
        },
        {
          name: 2,
          exercises: ['Squat', 'Overhead Press', 'Deadlift']
        }
      ]
    }
  end

  def self.greyskull
    {
      program_attributes:  {
          name: "Greyskull LP - Phrak's Variant",
          description: 'A popular linearly progressing AMRAP(as many reps as possible) routine that places less of a focus on squats than Starting Strength or StrongLifts.',
          featured: true
      },
      program_links: [
        {
        name: 'https://old.reddit.com/r/Fitness/wiki/phraks-gslp',
        description: 'Reddit Guide'
        }
      ],
      exercises: [
        'Squat', 'Bench Press', 'Overhead Press', 'Deadlift', 'Row', 'Chin-up'
      ],
      days: [
        {
          name: 1,
          exercises: ['Squat', 'Bench Press', 'Deadlift']
        },
        {
          name: 2,
          exercises: ['Squat', 'Overhead Press', 'Deadlift']
        }
      ]
    }
  end

  def self.boring_but_big
    {
      program_attributes:  {
          name: 'Boring But Big',
          description: "Jim Wendler's popular no-frills routine for strength and size.",
          featured: true
      },
      program_links: [
        {
        name: 'https://jimwendler.com/blogs/jimwendler-com/101077382-boring-but-big',
        description: 'Visit their official site for more info'
        }
      ],
      exercises: [
        'Squat', 'Bench Press', 'Overhead Press', 'Deadlift'
      ],
      days: [
        {
          name: 1,
          exercises: ['Squat', 'Bench Press', 'Deadlift']
        },
        {
          name: 2,
          exercises: ['Squat', 'Overhead Press', 'Deadlift']
        }
      ]
    }
  end





  def self.add_standard_exercises_using_name(parent, exercises_name_array)
    exercises_name_array.each do |name|
      if valid_exercise = Exercise.find_by(name: name, standard: true)
        parent.exercises << valid_exercise
      end
    end
  end

  def set_defaults
    self.featured = false if self.featured.nil?
  end
end
