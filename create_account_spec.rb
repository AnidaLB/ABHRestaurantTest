require 'rspec'
require 'watir'
require 'selenium-webdriver'

browser = Watir::Browser.new :chrome

RSpec.configure do |config|
  config.color = true
  config.formatter = :documentation
  config.before(:each) { @browser = browser }
  config.before(:all) {browser.window.maximize}
  config.after(:suite) { browser.close unless browser.nil? }
end


describe 'ABH restaurants regression test' do

	context 'When creating an account' do

		it 'should open ABH restaurants page' do
			@browser.goto('https://abh-restaurants.herokuapp.com')
		end

		it 'should go to login page' do
			@browser.a(id: 'login-link').click
		end

		it 'should open the Create account page' do
			@browser.a(id: 'registration-link').click
		end

		it 'should try to submit an empty form' do
			@browser.button(visible_text: 'Create Account').click!
		end

		it 'should close the warning window' do
			@browser.button(class: ["swal2-confirm", "swal2-styled"]).click
		end

		it 'should enter the first name' do
			@browser.input(placeholder: 'First Name').send_keys "Jane"
		end

		it 'should enter the last name' do
			@browser.input(placeholder: 'Last Name').send_keys "Doe"
		end

		it 'should enter the wrong email format' do
			@browser.input(placeholder: 'Email').send_keys "email@"
		end

		it 'should enter the phone number' do
			@browser.input(placeholder: 'Phone Number').send_keys "060060060"
		end

		it 'should choose the country' do
			@browser.option(text: 'USA').click
		end

		it 'should choose the city' do
			@browser.option(text: 'Chicago').click
		end

		it 'should enter password' do
			@browser.input(placeholder: 'Password').send_keys "sifrazaaplikaciju"
		end

		it 'should confirm the password' do
			@browser.input(placeholder: 'Confirm password').send_keys "sifrazaaplikaciju"
		end

		it 'should submit the form' do
			@browser.button(visible_text: 'Create Account').click
		end

		it 'should close the warning window' do
			@browser.button(class: ["swal2-confirm", "swal2-styled"]).click
		end

		it 'should enter valid e-mail format' do
			@browser.input(placeholder: 'Email').to_subtype.clear
			@browser.input(placeholder: 'Email').send_keys "janedoe@gmail.com" 
		end

		it 'should enter invalid phone number format' do
			@browser.input(placeholder: 'Phone Number').to_subtype.clear
			@browser.input(placeholder: 'Phone Number').send_keys "phone"
		end

		it 'should try to submit form' do
			@browser.button(visible_text: 'Create Account').click
		end

		it 'should close the warning window' do
			@browser.button(class: ["swal2-confirm", "swal2-styled"]).click
		end

		it 'should enter valid phone number' do
			@browser.input(placeholder: 'Phone Number').to_subtype.clear
			@browser.input(placeholder: 'Phone Number').send_keys "060060060"
		end

		it 'should enter different passwords' do
			@browser.input(placeholder: 'Confirm password').to_subtype.clear
			@browser.input(placeholder: 'Confirm password').send_keys "somethingelse"
		end

		it 'should try to submit the form' do
			@browser.button(visible_text: 'Create Account').click
		end

		it 'should close the warning window' do
			@browser.button(class: ["swal2-confirm", "swal2-styled"]).click
		end

		it 'should enter valid information' do
			@browser.input(placeholder: 'Confirm password').to_subtype.clear
			@browser.input(placeholder: 'Confirm password').send_keys "sifrazaaplikaciju"
		end

		it 'should submit the form and create account' do
			@browser.button(visible_text: 'Create Account').click
		end

		it 'should close the confirmation window' do
			@browser.button(class: ["swal2-confirm", "swal2-styled"]).click
		end

	end
end