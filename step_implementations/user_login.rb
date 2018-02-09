# Not using the Page Object model is alien to me, but if
# https://github.com/getgauge-examples/ruby-selenium/blob/master/step_implementations/customer_signup.rb
# is not using it, neither am I with this experiment.

require 'test/unit'
require_relative './utils/driver'

include Test::Unit::Assertions
include ::Driver

step 'Login as username <username> and <password>' do |username,password|

  puts "\nLogin Page:"
  puts "\t* Entering username: " + username
  driver.find_element(:id,"username").send_keys(username);

  puts "\t* Entering password: " + password
  driver.find_element(:id,"password").send_keys(password);

  puts "\t* Selecting Login Button."
  driver.find_element(:css,"[type='submit'][class='radius']").click;
  puts "\t* Login Button Pressed (PASS)"
  sleep(5) # Do not do this in a real project. You are adding five seconds of lag into your framework.

end
