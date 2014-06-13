require "test_helper"

class RecipeFlowsTest < ActionDispatch::IntegrationTest
  fixtures :recipes
  test 'create recipes' do
    https! # sign in emulation
    curry = recipes(:curry)
    get '/recipes/new'
    assert_response :success

    post_via_redirect '/recipes/new', title: recipes(:curry).title
    assert_equal '/recipes', path
    assert_equal 'Create Recipe', flash[:notice]

    https!(false) # sign out emulation
    get '/recipes'
    assert_response :success
    assert assigns(:recipes) # fetch out inst var :recipes (in controller)
  end
end
