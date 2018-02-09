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

## How is this project scaffolded?

What is wonderful about Gauge is that I did not have to use Yeoman.io or any other tool to scaffold this project, i.e. figure out the folder structure and code just to get things up and running. I created a new directory on my local machine, entered the directory, and entered:

`gauge init ruby`

Want to see what code that command produced? See the [gauge_0.9.7_default_code](https://github.com/tjmaher/gauge_0.9.7_default_code) that I stored on GitHub. 

All I had to do was take the Ruby code that Gauge created in [ruby-selenium](https://github.com/getgauge-examples/ruby-selenium), and hack on it inexpertly until it could run the [The-Internet Login](https://the-internet.herokuapp.com/login). 

I'm only week two into working with Ruby.

## I have Questions!

Are you an expert on Gauge? 

### How do you work with selenium-ruby?

I was planning on working towards what Dave Haefnner has in [ElementalSelenium.com] creating a library of:
* Using [Base Page Objects](http://elementalselenium.com/tips/9-use-a-base-page-object) to wrap Selenium Ruby calls with proper waits.
* Using [Page Objects](http://elementalselenium.com/tips/7-use-a-page-object), so that when locators inevitably change, I know where exactly to fix them.
* Making the [tests data-driven](http://elementalselenium.com/tips/19-data-driven-testing)
* Adding [Rescue exceptions](http://elementalselenium.com/tips/44-exception-handling) to avoid weeding through Stack traces.
* Maybe [JQuery Growl for better logging](http://elementalselenium.com/tips/53-growl), and [Wrapped Selenium Tests](http://elementalselenium.com/tips/55-wrapper)

I am brand-new to Gauge and using Selenium-Ruby. So far I only have used Selenium-Java.

It looks like Gauge [strongly advocates against page objects](https://blog.getgauge.io/are-page-objects-anti-pattern-21b6e337880f) calling them an Anti-Pattern. Er... Um... burying a page's locators in code, as they do in the blog makes me worried. Looking for other solutions.

