require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  def setup
    @chef = Chef.create(chefname: "bob", email: "bob@example.com")
    @recipe = @chef.recipes.build(name: "Chicken Parm", summary: "This is the best chicken parm recipe ever", description: "Heat oil, add onions, add tomato sauce, add chicken, cook for 20 minutes")
  end
  
  test "recipe should be valid" do
    puts "Recipe is valid" if assert @recipe.valid?
  end
  
  test "Chef_id should be present" do
    @recipe.chef_id = nil
    puts "Recipe gitChef_id is present" if assert_not @recipe.valid?
  end
  
  test "name should be present" do
    @recipe.name = " "
    puts "Recipe name is present" if assert_not @recipe.valid?
  end
  
  test "name length should not be too long" do
    @recipe.name = @recipe.name * 101
    puts "Recipe name is not too long" if assert_not @recipe.valid?
  end
  
  test "name length should not be too short" do
    @recipe.name = "ifif"
    puts "Recipe name is not too short" if assert_not @recipe.valid?
  end
  
  test "summary should be present" do
    @recipe.summary = " "
    puts "Recipe summary is present" if assert_not @recipe.valid?
  end
  
  test "summary should not be too long" do
    @recipe.summary = @recipe.summary * 100
    puts "Recipe summary is not too long" if assert_not @recipe.valid?
  end
  
  test "summary should not be too short" do
    @recipe.summary = "soks"
    puts "Recipe summary is not too short" if assert_not @recipe.valid?
  end
  
  test "description should be present" do
    @recipe.description = " "
    puts "Recipe description is present" if assert_not @recipe.valid?
  end
  
  test "description should not be too long" do
    @recipe.description = @recipe.description * 100
    puts "Recipe description is not too long" if assert_not @recipe.valid?
  end
  
  test "description should not be too short" do
    @recipe.description = "sojd"
    puts "Recipe description is not too short" if assert_not @recipe.valid?
  end
end