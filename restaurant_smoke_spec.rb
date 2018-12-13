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


describe 'ABH restaurants smoke test' do

	context 'When making a reservation' do

		it 'should open ABH restaurants page' do
			@browser.goto('https://abh-restaurants.herokuapp.com')
		end

		it 'should go to login page' do
			@browser.a(id: 'login-link').click
		end

		it 'should enter the email' do
			@browser.input(:placeholder => 'Email').send_keys 'janedoe@gmail.com'
		end

		it 'should enter the password' do
			@browser.input(:placeholder => 'Password').send_keys 'sifrazaaplikaciju'
		end

		it 'should login to application' do
			@browser.button(class: ["form-control", "login-button", "btn"]).click
		end

		it 'should close the confirmation window' do
			@browser.button(class: ["swal2-confirm", "swal2-styled"]).click
		end

		it 'should go to the Restaurants section' do
			@browser.link(href: "/restaurant-list").wait_until_present
			@browser.link(href: "/restaurant-list").click!
		end

		it 'should enter the name of the restaurant to search for' do
			@browser.input(placeholder: 'Search for a restaurant...').send_keys 'U2'
		end

		it 'should search for a restaurant' do
			@browser.button(class: ["form-control", "table-button", "btn"]).click
		end

		it 'should open the restaurants page' do
			@browser.button(class: ["form-control", "reserve-button--list", "btn"]).click
		end

		it 'should choose a table for 4 people' do
			@browser.option(text: "4 people").click
		end

		it 'should choose the date' do
			@browser.input(class: ["calendar-picker", "ember-view"]).to_subtype.clear
			@browser.input(class: ["calendar-picker", "ember-view"]).send_keys "December 26,2019"
		end

		it 'should choose the time' do
			@browser.element(class: "ember-power-select-status-icon").click
			@browser.input(class: "ember-power-select-search-input").send_keys "20:30"
			@browser.send_keys :enter
		end

		it 'should find the table' do
			@browser.button(class: ["form-control", "find-table-button", "btn"]).click
		end

		it 'should complete the reservation' do
			@browser.button(class: ["form-control", "login-button--reservation", "btn"]).wait_until_present
			@browser.button(class: ["form-control", "login-button--reservation", "btn"]).click

		end

		it 'should close the confirmation window' do
			@browser.button(class: ["swal2-confirm", "swal2-styled"]).click
		end

	end
end