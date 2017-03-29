require "rspec/expectations"
require_relative "../../libs/ssimata.browser"
require_relative "../../utils/utils.module"


Given(/^I am on search work page with username "([^"]*)" and password "([^"]*)"$/) do |email, password|
    @browser = SSIMATA.browser
    @wait = Selenium::WebDriver::Wait.new(:timeout => 30)
    SSIMATA.login(email, password, @browser)
    SSIMATA.goToSearchWork(@browser)
    Utils.switchWindow(1, @browser)
end

When(/^Search work tab is loaded, search work with id (\d+)$/) do |id|
    searchInput = @wait.until { @browser.find_element(:id => 'input0') }
    searchInput.send_keys id
end

When(/^Search work tab is loaded, search work with name "([^"]*)"$/) do |name|
    searchInput = @wait.until { @browser.find_element(:id => 'input0') }
    searchInput.send_keys name
end

Then(/^I should see work with title "([^"]*)"$/) do |title|
    sleep 5
    viewWork = @wait.until { @browser.find_element(:class => "preview__title") }
    viewWork.click
    titleField = @wait.until { @browser.find_element(:css, "span[data-field='grid.title.grid_title']") }
    expect(titleField.text).to eq(title)
    @browser.quit
end
