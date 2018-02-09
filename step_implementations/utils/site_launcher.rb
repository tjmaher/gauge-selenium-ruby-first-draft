# Based on:
# https://github.com/getgauge-examples/ruby-selenium/blob/master/step_implementations/utils/app_launcher.rb

require 'test/unit'
require_relative './driver'

include Test::Unit::Assertions
include ::Driver

step 'Navigate to the login page' do
  driver.navigate.to ENV['APP_URL']
  assert_equal 'The Internet', driver.title
end
