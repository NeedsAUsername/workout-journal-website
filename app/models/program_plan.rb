class ProgramPlan < ApplicationRecord
  belongs_to :user
  has_many :exercise_program_plans
  has_many :exercises, through: :exercise_program_plans
  has_many :links

  after_initialize :set_defaults, unless: :persisted?

  validates :name, :presence => true

  # featured programs will be shown on the program index page for the user to browse and choose. The featured boolean is there
  # so that other user's created programs do not show up on everybody's program index page.

  # use this method in seeds to quickly create the featured programs.
  # In db/seeds: ProgramPlan.create_or_update_featured_programs
  # Later, could refactor this into an admin class that has many programs, and can do this through the browser.

  def self.create_or_update_featured_programs
    self.featured_program_plan_attributes.each_with_index do |plan_attributes, index|
      if user = User.find_by(email: "admin#{index}@admin.com")
        user.program_plan.update(plan_attributes[:program_attributes])
        destroy_objects(user.program_plan.links)
        user.program_plan.exercises.clear
      else
        user = User.create(email: "admin#{index}@admin.com", name: 'admin', password: 'pass')
        user.build_program_plan(plan_attributes[:program_attributes])
      end
        user.program_plan.links.build(plan_attributes[:program_links])
        plan_attributes[:exercises].each do |exercise|
          user.program_plan.exercises << Exercise.find_by(name: exercise)
        end
        user.program_plan.save
        user.save
    end
  end

  private

  # add any new featured program attributes to this array
  def self.featured_program_plan_attributes
    [self.starting_strength_attributes, self.strong_lifts_attributes]
  end

  def self.starting_strength_attributes
    {
      program_attributes: {
      name: 'Starting Strength',
      description: 'A 3x5 squat-focused training system that focuses on building a foundation of strength with full-body workouts that utilize compound lifts.',
      featured: true
      },
      program_links: [
        {
        name: 'https://startingstrength.com/get-started/programs',
        description: 'for more information on the program, visit their official site'
        }
      ],
      exercises: [
        'Bench Press', 'Overhead Press'
      ]
    }
  end

  def self.strong_lifts_attributes
    {
      program_attributes:  {
          name: 'Strong Lifts',
          description: 'A simple but effective 5x5 squat-focused training routine for building strength.',
          featured: true
      },
      program_links: [
        {
        name: 'https://stronglifts.com/5x5/',
        description: 'for more information on the program, visit their officail site'
        }
      ],
      exercises: [
        'Bench Press', 'Overhead Press'
      ]
    }

  end

  def self.destroy_objects(obj_array)
    obj_array.each do |obj|
      obj.destroy
    end
  end

  def set_defaults
    self.featured = false if self.featured.nil?
  end
end
