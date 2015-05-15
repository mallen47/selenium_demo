class Driver

  attr_accessor :driver

  def self.instance
    @driver
  end

  def self.init browser
    case browser
      when 'firefox'
        @driver = Selenium::WebDriver.for :firefox
      when 'chrome'
        Selenium::WebDriver::Chrome::Service.executable_path = File.join(Dir.pwd, '/vendor/chromedriver')
        @driver = Selenium::WebDriver.for :chrome
    end
  end
end