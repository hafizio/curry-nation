class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :sidebar_values

  private
  def sidebar_values
    @food_preferences = FoodPreference.select(:name).map { |x| x.name }
    @food_types = FoodType.select(:name).map { |x| x.name }
    @cuisines = Cuisine.select(:name).map { |x| x.name }
  end
  # @food_preferences = FoodPreference.all
end
