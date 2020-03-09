require 'selenium-webdriver'
require 'rspec'
require 'rspec/expectations'
extend RSpec::Matchers

describe "Search for Hasan's LinkedIn profile" do
    before(:each) do
        options = Selenium::WebDriver::Chrome::Options.new
        options.add_argument('--headless')
        options.add_argument('--no-sandbox')
        @driver = Selenium::WebDriver.for(:chrome, options: options)
        @base_url = "https://www.google.com/"
    end

    context "Visit profile" do
        it "verifies the expected title" do
            @driver.get(@base_url)
            wait = Selenium::WebDriver::Wait.new(:timeout => 15)
            search_box = wait.until { @driver.find_element(:name, 'q') }
            search_box.send_keys "hasan ali tariq test automation engineer linkedIn"
            search_box.send_keys :enter
            my_linkedIn_profile_link = wait.until { @driver.find_element(:css, 'a[href$=\'hassanali635\']') }
            my_linkedIn_profile_link.click
            my_linkedIn_profile_title = wait.until { @driver.find_element(:xpath, '//h1[contains(text(),\'Hasan Ali Tariq\')]') }
            title_text = my_linkedIn_profile_title.text
            expect(title_text).to   eq('Hasan Ali Tariq')
            @driver.save_screenshot('/home/app/rspec-scripts/profile.png')
            @driver.quit
        end
    end
end