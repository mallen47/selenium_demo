require_relative '../lib/driver'

class BasePage
  class << self

    attr_accessor :driver

    def goto_page url_path
      Driver.instance.get ENV['base_url'] + url_path
    end

    def type(locator, text)
      find(locator).send_keys(text)
    end

    def title
      Driver.instance.title
    end

    def close locator
      click locator
    end

    def click locator
      find(locator).click
    end

    def submit locator
      find(locator).submit
    end

    def find locator
      Driver.instance.find_element locator
    end


    def is_displayed? locator
      rescue_exception { Selenium::WebDriver::Wait.new(timeout: 10).until {find(locator).displayed? }}
    end

    def rescue_exception
      begin
        yield
      rescue Selenium::WebDriver::Error::NoSuchElementError
        false
      end
    end

  end

end