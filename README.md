# gauge-selenium-ruby-first-draft

[T.J. Maher](http://tjmaher.com)'s first attempt using [Gauge.org](http://gauge.org) + [Selenium-Ruby](https://github.com/SeleniumHQ/selenium/wiki/Ruby-Bindings), ripping off code from Gauge's example project, [ruby-selenium](https://github.com/getgauge-examples/ruby-selenium) so he can attempt to understand this BDD framework he is encountering for the first time. 

This project focuses on understanding the Gauge framework, not selenium-ruby. Both the Ruby code and the Selenium formatting are left as minimalist and unstructured as possible, hacked together quickly to get it up and running. 

## Running this example
The tests are run on Headless Chrome by default.

### Prerequisites

This example requires the following softwares to run.
  * [ruby-2.3.1](https://www.ruby-lang.org/en/news/2016/04/26/ruby-2-3-1-released/) or above
  * [Gauge](http://getgauge.io/get-started/index.html)
  * Gauge Ruby plugin
    * can be installed using `gauge install ruby`
  * Chrome
  

### The System Under Test (SUT)

* We are testing against [Dave Haefner](https://twitter.com/tourdedave)'s The-Internet Login page at https://the-internet.herokuapp.com/login.

## Run specs

Go into the *gauge-selenium-ruby-first-draft* and make sure you have all the dependencies. Run: `bundle`

You can execute specs as `bundle exec gauge specs`
Gauge specs are run with [Maven](http://maven.apache.org/index.html).

Chrome is the default browser for specs execution. Make sure Chrome is installed in your machine and [chromedriver](https://sites.google.com/a/chromium.org/chromedriver/) is in PATH.

## How is this project scaffolded?

What is wonderful about Gauge is that I did not have to use Yeoman.io or any other tool to scaffold this project, i.e. figure out the folder structure and code just to get things up and running. I created a new directory on my local machine, entered the directory, and entered:

`gauge init ruby`

Want to see what code that command produced? See the [gauge_0.9.7_default_code](https://github.com/tjmaher/gauge_0.9.7_default_code) that I stored on GitHub. 

All I had to do was take the Ruby code that Gauge created in [ruby-selenium](https://github.com/getgauge-examples/ruby-selenium), and hack on it inexpertly until it could run the [The-Internet Login](https://the-internet.herokuapp.com/login). 

I'm only week two into working with Ruby.

## Questions: Are you an expert on Gauge? 

### How do you work with selenium-ruby?

I was planning on working towards what Dave Haeffner has in [ElementalSelenium.com](http://elementalselenium) creating a library of:
* Using [Base Page Objects](http://elementalselenium.com/tips/9-use-a-base-page-object) to wrap Selenium Ruby calls with proper waits.
* Using [Page Objects](http://elementalselenium.com/tips/7-use-a-page-object), so that when locators inevitably change, I know where exactly to fix them.
* Making the [tests data-driven](http://elementalselenium.com/tips/19-data-driven-testing)
* Adding [Rescue exceptions](http://elementalselenium.com/tips/44-exception-handling) to avoid weeding through Stack traces.
* Maybe [JQuery Growl for better logging](http://elementalselenium.com/tips/53-growl), and [Wrapped Selenium Tests](http://elementalselenium.com/tips/55-wrapper)

I am brand-new to Gauge and using Selenium-Ruby. So far I only have used Selenium-Java.

It looks like Gauge [strongly advocates against page objects](https://blog.getgauge.io/are-page-objects-anti-pattern-21b6e337880f) calling them an Anti-Pattern. Er... Um... burying a page's locators in code, as they do in the blog makes me worried. Looking for other solutions.

## Contents

### env/default:
* [default properties](https://github.com/tjmaher/gauge-selenium-ruby-first-draft/blob/master/env/default/default.properties): Points to where the reports and logs are, chooses Chrome to be the default browser, and chooses whether or not you should overwrite reports, capture screenshots on failure, enable multithreading. You can also choose when you want the objects to be cleatred... after execution of suite, spec, or scenario. 
* [user properties](https://github.com/tjmaher/gauge-selenium-ruby-first-draft/blob/master/env/default/user.properties): Points to the APP_URL, and chooses if you want the tests to be headless or not. 

### specs
* [UserAction.spec](https://github.com/tjmaher/gauge-selenium-ruby-first-draft/blob/master/specs/UserActions.spec): Heavily ripped off of the Gauge sample project, [ruby-selenium](https://github.com/getgauge-examples/ruby-selenium), this is the "executable specification file. This file follows markdown syntax. Every heading in this file denotes a scenario. Every bulleted point denotes a step". Contains "Login as username <username> and <password>", "Check if the user is logged in" and "Log out". Also contains a data table for username and passwords.
* [concepts/Authentication.cpt](https://github.com/tjmaher/gauge-selenium-ruby-first-draft/blob/master/specs/concepts/Authentication.cpt): Specs can refer to these concepts, "Check if the user is logged in" and "Log out", breaking them down.  
 
 ### step_implementations
 * [authentication.rb](https://github.com/tjmaher/gauge-selenium-ruby-first-draft/blob/master/step_implementations/authentication.rb): Contains the selenium-ruby code that acts out the steps "Give an option to Log Out", 'Give an option to Log In' and a logout method.
 * [user_login](https://github.com/tjmaher/gauge-selenium-ruby-first-draft/blob/master/step_implementations/user_login.rb): Contains the step "Login as username <username> and <password>", which uses selenium-ruby to send text to the username and password textbox, and presses the Login button. 
 
 ### step_implementation_utils
 * [driver.rb](https://github.com/tjmaher/gauge-selenium-ruby-first-draft/blob/master/step_implementations/utils/driver.rb): Contains the setup and teardown methods, creating the driver and quitting the driver. Also sets up the driver with:
 
 ```
options = Selenium::WebDriver::Chrome::Options.new
@@driver = Selenium::WebDriver.for :chrome, options: options
options.add_argument('--headless')
options.add_argument('--disable-gpu')
```
 * [find_message](https://github.com/tjmaher/gauge-selenium-ruby-first-draft/blob/master/step_implementations/utils/find_messages.rb): Any messages that you need to check for? There is this method that Gauge's ruby-selenium has, "Show a message <message>".
* [screengrabber.rb](https://github.com/tjmaher/gauge-selenium-ruby-first-draft/blob/master/step_implementations/utils/screengrabber.rb): Provides a wrapper for `driver.save_screenshot('/tmp/screenshot.png')`
 
* [site_launcher](https://github.com/tjmaher/gauge-selenium-ruby-first-draft/blob/master/step_implementations/utils/site_launcher.rb): Contains the step "Navigate to the login page", which then does:

```driver.navigate.to ENV['APP_URL']
  assert_equal 'The Internet', driver.title
  ```
[Gemfile](https://github.com/tjmaher/gauge-selenium-ruby-first-draft/blob/master/Gemfile): The dependencies for the project. 

* gem 'gauge-ruby'
* gem 'selenium-webdriver'
* gem 'test-unit'
* gem 'chromedriver-helper'
  




