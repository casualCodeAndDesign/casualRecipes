require 'test_helper'

class ChefTest < ActiveSupport::TestCase
  def setup
    @chef = Chef.new(chefname: "John", email: "john@example.com")
  end
  
  test "Chef should be valid" do
    puts "Chef is valid" if assert @chef.valid?
  end
  
  test "Chef name should be present" do
    @chef.chefname = " "
    puts "Chef name is present" if assert_not @chef.valid?
  end
  
  test "Chefname should not be too long" do
    @chef.chefname = "a" * 41
    puts "Chefname is not too long" if assert_not @chef.valid?
  end
  
  test "Chefname should not be too short" do
    @chef.chefname = "sd"
    puts "Chefname is not too short" if assert_not @chef.valid?
  end
  
  test "Email should be present" do 
    @chef.email = " "
    puts "Email is present" if assert_not @chef.valid?
  end
  
  test "Email length should be within bounds" do
    @chef.email = "a" * 106 + "@example.com"
    puts "Email length is within the bounds" if assert_not @chef.valid?
  end
  
  test "Email should be unique" do 
    local_chef = @chef.dup
    local_chef.email = @chef.email.upcase
    @chef.save
    puts "Email is unique" if assert_not local_chef.valid?
  end
  
  test "Email validation should accept valid addresses..." do
    valid_addresses = %w[user@eee.com R_TDD-DS@eee.hello.org user@example.com first.last@eeem.au laura+joe@monk.cm]
    valid_addresses.each do |val|
      @chef.email = val
      puts "Email validation accept valid addresses" if assert @chef.valid?, '#{val.inspect} should be valid'
    end
  end
  
  test "Email validation should reject invalid addresses..." do
    invalid_addresses = %w[user@example,com user_at_eee.org user.name@example. eee@i_am_.com foo@ee+aar.com]
    invalid_addresses.each do |ival|
      @chef.email = ival
      puts "Email validation rejects invalid addresses" if assert_not @chef.valid?, '#{ival.inspect} should be invalid'
    end
  end
end