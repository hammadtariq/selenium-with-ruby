require_relative 'config.rb'
require 'selenium-webdriver'

module SSIMATA

    @host = Config.settings['localhost']

    def SSIMATA.browser
        client = Selenium::WebDriver::Remote::Http::Default.new
        client.read_timeout = 90 # seconds
        browser = Selenium::WebDriver.for :chrome, :http_client => client
        return browser
    end

    def SSIMATA.login(email, password, browser)
        @browser = browser
        @browser.get @host
        wait = Selenium::WebDriver::Wait.new(:timeout => 10)
        loginBtn = wait.until { @browser.find_element(:class => 'header_login') }
        loginBtn.click
        @browser.find_element(:name => "email").send_keys email
        @browser.find_element(:name => "password").send_keys password
        @browser.find_element(:class => "signin").click
    end

    def SSIMATA.goToSearchWork(browser)
        sleep 10
        wait = Selenium::WebDriver::Wait.new(:timeout => 20)
        parent = wait.until { @browser.find_element(:css => 'div#recordPanel') }
        firstchild = parent.find_element(:css => 'div.x-panel-header.x-unselectable')
        secondchild = parent.find_element(:css => 'div.x-tool.x-tool-gear')
        secondchild.click
        sleep 3
        lis = @browser.find_elements(:class => 'x-menu-item-text')
        lastitem = lis[lis.size-1]
        lastitem.click
    end

    def SSIMATA.searchWork(input, browser)
        wait = Selenium::WebDriver::Wait.new(:timeout => 30)
        searchInput = wait.until { browser.find_element(:id => 'input0') }
        searchInput.send_keys input        
    end

end
