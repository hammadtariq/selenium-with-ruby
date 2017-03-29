require "rspec/expectations"
require_relative "../../libs/ssimata.browser"
require_relative "../../utils/utils.module"

Given(/^I am valid user with username "([^"]*)" and password "([^"]*)" in search work page$/) do |email, password|
    @browser = SSIMATA.browser
    @wait = Selenium::WebDriver::Wait.new(:timeout => 30)
    SSIMATA.login(email,password,@browser)
    SSIMATA.goToSearchWork(@browser)
    Utils.switchWindow(1, @browser)
end

When(/^Search work tab is loaded search for specific work by id, select it from list view and click on edit work button$/) do
    SSIMATA.searchWork(8000477445, @browser)
    # @browser.text_field(:placeholder => 'Keyword').wait_until_present.set 8000477445
    li = @wait.until { @browser.find_element(:css => "div[title='Combine harvest cotton']") }
    li.click
    # @browser.div(:title => '').wait_until_present.click
    sleep 2
    editWorkBtn = @wait.until { @browser.find_element(:css => "a[data-button='edit.work.button']") }
    editWorkBtn.click
    data_hash = Utils.readJsonFile('../editWork.json')
    # termFields = @wait.until { @browser.find_elements(:css, "textarea[data-field='grid.title.term']") }
    # termFields[1].send_keys data_hash['title2']
    sleep 3
    termFields = @browser.find_elements(:css, "textarea[data-field='grid.title.term']")
    termFields[1].send_keys data_hash['title2']
    type_lkup = @wait.until { @browser.find_element(:css, "div[data-field='grid.title.type_lkup']") }
    type_lkup.click
    sleep 2
    @browser.find_element(:css, "div[data-field='linking-button']").click
    @browser.find_element(:css => "a[data-button='save-and-close-button']").click
    sleep 3
    item2 = @browser.find_element(:css => "button[data-button='alert.ok']").click
    puts "button #{item2}"
    # item2 = @browser.element(:css, "div[data-field='grid.country.term_lkup']").present?
    sleep 10
end
 
Then(/^Verify is new changes applied successfully$/) do
    # Utils.switchWindow(1, @browser)
    data_hash = Utils.readJsonFile('../editWork.json')
    SSIMATA.searchWork(8000477445, @browser)
    # parent = @wait.until { @browser.find_element(:css => "div[title='#{str}']") }
    parent.find_element(:class => "preview__title").click
    field = @wait.until { @browser.find_element(:css, "span[data-field='grid.title.grid_title']") }
    fieldVal = field.text
    puts "value #{fieldVal}"
    # expect(fieldVal).to eq(str)
    @browser.quit
end
