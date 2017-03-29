require "rspec/expectations"
require_relative "../../libs/ssimata.browser"

Given(/^I opened login page of ssimata$/) do 
  @browser = SSIMATA.browser
  @browser.get "http://localqa2.artstor.acit.com"
end
 
When(/^Login page is available I should do login using a valid account "([^"]*)" and "([^"]*)"$/) do |email, password|
  sleep 5
  expect(@browser.current_url).to eq('http://localqa2.artstor.acit.com/login.html')
  wait = Selenium::WebDriver::Wait.new(:timeout => 10)
  loginBtn = wait.until { @browser.find_element(:class => 'header_login') }
  loginBtn.click
  @browser.find_element(:name => "email").send_keys email
  @browser.find_element(:name => "password").send_keys password
  @browser.find_element(:class => "signin").click
end
 
Then(/^I should see project manager page$/) do
  sleep 5
  expect(@browser.current_url).to match("http://localqa2.artstor.acit.com/index.html#projectManager")
  @browser.quit
end