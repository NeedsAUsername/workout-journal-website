class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true


  def self.destroy_objects(obj_array)
    obj_array.each do |obj|
      obj.destroy
    end
  end
  
end
