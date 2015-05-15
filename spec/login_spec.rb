require_relative 'spec_helper'
require_relative '../pages/login_page'


describe 'Login' do

  it 'logs in' do
    LoginPage.goto
    LoginPage.login_as('tomsmith').with_password('SuperSecretPassword!').login
    expect(LoginPage.is_displayed? (LoginPage.login_confirmation_message)).to be true
  end

end