require 'test/unit'
require_relative './utils/driver'

include Test::Unit::Assertions
include ::Driver

step 'Log out the user' do
    logout();
end

step 'Give an option to Log Out' do
  logOut = driver.find_element(:link_text, 'Logout')
  assert_true logOut.displayed?
end

step 'Give an option to Log In' do
  logIn = driver.find_element(:css, "[type='submit'][class='radius']")
  assert_true logIn.displayed?
end

def logout
  driver.find_element(:xpath, "//*[@class='button secondary radius']").click
end
