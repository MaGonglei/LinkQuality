require 'cucumber/rb_support/rb_dsl'
require 'rspec-expectations'
require 'selenium-webdriver'


Before do
  @driver = Selenium::WebDriver.for :firefox
end

After do
  @driver.quit
end