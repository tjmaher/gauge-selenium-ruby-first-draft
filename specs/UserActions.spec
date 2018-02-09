# Verify that user can log in and out of system
tags: authorized, user

These tests are heavily ripped off of the Gauge sample project:
  https://github.com/getgauge-examples/ruby-selenium

This is an executable specification file. This file follows
markdown syntax. Every heading in this file denotes a scenario.
Every bulleted point denotes a step.

To execute this specification, run either:

    bundle exec gauge run specs // Default runs with Chrome
    bundle exec gauge run specs --env="firefox"
    bundle exec gauge run specs --env="ie"

     |username|password            |
     |--------|--------------------|
     |tomsmith|SuperSecretPassword!|

* Navigate to the login page

## Login and press the Login Button
* Login as username <username> and <password>
* Check if the user is logged in
* Log out
