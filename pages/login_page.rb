require_relative 'base_page'

class LoginPage < BasePage

  attr_reader :driver

  LOGIN_FORM        = { id: 'login' }
  USERNAME_FIELD    = { id: 'username' }
  PASSWORD_FIELD    = { id: 'password' }
  SUCCESS_MESSAGE   = { css: '.flash.success' }

  def driver
    @driver
  end

  class << self
    def goto
      @driver = Driver.instance
      goto_page '/login'
    end


    def login_as username
      LoginCommand.new(username, self)
    end

    def username_locator
      USERNAME_FIELD
    end

    def password_locator
      PASSWORD_FIELD
    end

    def login_form_locator
      LOGIN_FORM
    end

    def login_confirmation_message
      SUCCESS_MESSAGE
    end
  end

end


class LoginCommand
  attr_reader :username, :password

  def initialize username, pageObj
    @username = username
    @page = pageObj
  end

  def with_password password
    @password = password
    self
  end

  def login
    @page.type(@page.username_locator, username)
    @page.type(@page.password_locator, password)
    @page.submit(@page.login_form_locator)
  end
end