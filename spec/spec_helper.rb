require 'selenium-webdriver'
require_relative '../lib/driver'

RSpec.configure do |config|

  config.before(:each) do
    Driver.init(ENV['browser'])
  end

  config.after(:each) do
    Driver.instance.quit
  end
end