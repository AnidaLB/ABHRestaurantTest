require 'watir'
require 'require_all'
require_all './libs'


site = Site.new(Watir::Browser.new :chrome)

describe 'ABH restaurants smoke test' do

	context 'When making a reservation' do


		it 'should open ABH restaurants page' do
			site.home_page.open
		end

		it 'should go to login page' do
			site.home_page.open_login
		end

		# it 'should go to create account page' do
		# 	site.login_page.open_form
		# end

		# it 'should enter the first name' do
		# 	site.account_page.enter_first_name 'Janes'
		# end

		# it 'should enter the last name' do
		# 	site.account_page.enter_last_name 'Doe'
		# end

		# it 'should enter email' do
		# 	site.account_page.enter_email 'janedoes@gmail.com'
		# end

		# it 'should enter phone number' do
		# 	site.account_page.enter_phone_number '062062062'
		# end

		# it 'should choose the country' do
		# 	site.account_page.open_countries
		# 	site.account_page.choose_country
		# end

		# it 'should choose the city' do
		# 	site.account_page.open_cities
		# 	site.account_page.choose_city
		# end

		# it 'should create password' do
		# 	site.account_page.enter_password 'sifrazaaplikaciju'
		# end

		# it 'should confirm the password' do
		# 	site.account_page.confirm_password 'sifrazaaplikaciju'
		# end

		# it 'should create account' do
		# 	site.account_page.submit_form
		# 	sleep 6
		# end

		it 'should enter email' do
			site.login_page.enter_email 'admin@abh.com'
		end

		it 'should enter password' do
			site.login_page.enter_password 'admin'
		end

		it 'should login to the page' do
			site.login_page.login
		end

		it 'should go to the Restaurants section' do
			site.home_page.go_to_restaurants
		end

		it 'should open the restaurants page' do
			site.restaurants_list_page.open_restaurant
		end

		it 'should open tables dropdown' do
			site.restaurant_page.open_tables
		end

		it 'should choose a table for 4 people' do
			site.restaurant_page.choose_table
		end

		it 'should choose the date' do
			site.restaurant_page.clear_date
			sleep 2
			site.restaurant_page.choose_date 'December 26,2019'
		end

		it 'should choose the time' do
			site.restaurant_page.open_time
			site.restaurant_page.choose_time '20:30'
			site.restaurant_page.send_time
			sleep 2
		end

		it 'should find the table' do
			site.restaurant_page.find_table
			sleep 2
		end

		it 'should complete the reservation' do
			site.confirmation_page.complete_reservation
			sleep 2
		end

		it 'should go to reservations history' do
			site.restaurant_page.open_profile
			site.restaurant_page.open_reservation_history
		end

		it 'should check if the reservation is in the list' do
			site.reservation_history_page.reservation
		end



	end
end
