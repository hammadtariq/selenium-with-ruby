require "rspec/expectations"
require_relative "../../libs/ssimata.browser"
require_relative "../../utils/utils.module"

Given(/^I am valid user with email "([^"]*)" and password "([^"]*)" in search work page$/) do |email, password|
    @browser = SSIMATA.browser
    @wait = Selenium::WebDriver::Wait.new(:timeout => 30)
    SSIMATA.login(email,password,@browser)
    SSIMATA.goToSearchWork(@browser)
    Utils.switchWindow(1, @browser)
end
 
When(/^Search work tab is loaded go to create new work tab, add title "([^"]*)" and click on save$/) do |title|
    newWorkBtn = @wait.until { @browser.find_element(:css => "a[data-button='new.work.button']") }
    newWorkBtn.click
    term = @wait.until { @browser.find_element(:css, "textarea[data-field='grid.title.term']") }
    term.send_keys title
    @browser.find_element(:css => "a[data-button='save-and-close-button']").click
end
 
Then(/^Verify is newly created work with title "([^"]*)" exists$/) do |title|
    sleep 5
    searchInput = @wait.until { @browser.find_element(:id => 'input0') }
    searchInput.send_keys title
    parent = @wait.until { @browser.find_element(:css => "div[title='#{title}']") }
    parent.find_element(:class => "preview__title").click
    field = @wait.until { @browser.find_element(:css, "span[data-field='grid.title.grid_title']") }
    fieldVal = field.text
    expect(fieldVal).to eq(title)
    @browser.quit
end

When(/^Search work tab is loaded go to create new work tab, add title1 and title2 do save$/) do
    # Utils.switchWindow(1, @browser)
    newWorkBtn = @wait.until { @browser.find_element(:css => "a[data-button='new.work.button']") }
    newWorkBtn.click
    data_hash = Utils.readJsonFile('../editWork.json')
    term = @wait.until { @browser.find_element(:css, "textarea[data-field='grid.title.term']") }
    term.send_keys data_hash['title1']
    termFields = @browser.find_elements(:css, "textarea[data-field='grid.title.term']")
    termFields[1].send_keys data_hash['title2']
    @browser.find_element(:css => "a[data-button='save-and-close-button']").click
end
 
Then(/^Verify is newly created work with title1 and title2 exists$/) do
    sleep 5
    # Utils.switchWindow(1, @browser)
    data_hash = Utils.readJsonFile('../editWork.json')
    str = "#{data_hash['title1']}|#{data_hash['title2']}"
    searchInput = @wait.until { @browser.find_element(:id => 'input0') }
    searchInput.send_keys str
    parent = @wait.until { @browser.find_element(:css => "div[title='#{str}']") }
    parent.find_element(:class => "preview__title").click
    field = @wait.until { @browser.find_element(:css, "span[data-field='grid.title.grid_title']") }
    fieldVal = field.text
    expect(fieldVal).to eq(str)
    @browser.quit
end