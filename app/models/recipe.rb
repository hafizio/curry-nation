class Recipe < ActiveRecord::Base
  DIFFICULTY = %w(Easy Medium Hard)

  belongs_to :food_type
  belongs_to :food_preference
  belongs_to :cuisine

  validates_presence_of :title, :food_type_id, :food_preference_id, :cuisine_id
end
