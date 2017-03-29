require "rspec/expectations"
require_relative "../../libs/ssimata.browser"

Given(/^login with username "([^"]*)" and password "([^"]*)" in search work page$/) do |email, password|
    @browser = SSIMATA.browser
    @wait = Selenium::WebDriver::Wait.new(:timeout => 60)
    SSIMATA.login(email,password,@browser)
    SSIMATA.goToSearchWork(@browser)
    Utils.switchWindow(1, @browser)
end
 
When(/^Search work tab is loaded select any two works and click on edit button$/) do
    sleep 10
    lis = @wait.until { @browser.find_elements(:class => 'row--item') }
    action = @browser.action
    action.key_down(:command)
    lis.each_with_index do |row,index|
        if index < 2
            action.click(row)
        end
    end
    action.key_up(:command)
    action.perform
    editWorkBtn = @wait.until { @browser.find_element(:css => "a[data-button='edit.work.button']") }
    editWorkBtn.click
end
 
Then(/^Write query and click on ok button$/) do
    sleep 10
    item = @wait.until { @browser.find_element(:class => "CodeMirror") }
    item.click
    @browser.action.send_keys("INSERT \"titles\" SET (\"titles.title\" = \"Selenium bulk edit\");").perform
    okBtn = @browser.find_element(:css => "button[data-button='bulk.edit.ok']")
    okBtn.click
    continueBtn = @wait.until { @browser.find_element(:css => "button[data-button='alert.ok']") }
    continueBtn.click
    sleep 5
    @browser.quit
end

