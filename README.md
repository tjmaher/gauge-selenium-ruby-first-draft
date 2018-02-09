# gauge-selenium-ruby-first-draft

[T.J. Maher](http://tjmaher.com)'s first attempt using [Gauge.org] + [Selenium-Ruby](https://github.com/SeleniumHQ/selenium/wiki/Ruby-Bindings), ripping off code from Gauge's example project, [ruby-selenium](https://github.com/getgauge-examples/ruby-selenium) so he can attempt to understand this BDD framework he is encountering for the first time. 

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

