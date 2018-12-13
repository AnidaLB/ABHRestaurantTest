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

		it 'should open sort section' do
			@browser.button(text: 'Sort by').click
		end

		it 'should sort by price range ASC' do
			@browser.element(id: 'asc').click!
		end

		it 'should open filter section' do
			@browser.button(text: 'Filter by').click
		end

		it 'should filter by price' do
			@browser.element(d: 'm10.317475,12.256545c-1.05118,-0.63288 -2.168751,-1.115074
                                        -3.275256,-1.61535c-0.641773,-0.289316 -1.255884,-0.626852
                                        -1.798071,-1.096992c-1.067778,-0.928224 -0.863074,-2.43508
                                        0.387277,-3.031795c0.354082,-0.168768 0.724761,-0.223015
                                        1.100973,-0.247124c1.449522,-0.084384 2.827121,0.204932
                                        4.13833,0.892059c0.652838,0.343563 0.868607,0.23507
                                        1.089908,-0.506304c0.232366,-0.783565 0.426005,-1.579186
                                        0.641773,-2.368779c0.143846,-0.530414 -0.033195,-0.880004
                                        -0.492395,-1.103019c-0.840944,-0.403838 -1.704018,-0.693154
                                        -2.611353,-0.849867c-1.183961,-0.198905 -1.183961,-0.204932
                                        -1.189493,-1.500829c-0.005533,-1.82631 -0.005533,-1.82631
                                        -1.687421,-1.82631c-0.243431,0 -0.486862,-0.006027
                                        -0.730294,0c-0.785619,0.02411 -0.9184,0.174795
                                        -0.94053,1.036717c-0.011065,0.385755 0,0.771511
                                        -0.005533,1.163293c-0.005533,1.145211 -0.011065,1.127129
                                        -1.017985,1.524939c-2.434312,0.964388 -3.939159,2.772616
                                        -4.099603,5.665781c-0.143846,2.561656 1.084375,4.291528
                                        3.015227,5.55126c1.189493,0.777538 2.506235,1.235622
                                        3.767651,1.844392c0.492395,0.23507 0.96266,0.506304
                                        1.372067,0.880004c1.211623,1.090964 0.990322,2.90522
                                        -0.448135,3.592346c-0.769021,0.367673 -1.582303,0.458084
                                        -2.417714,0.343563c-1.289079,-0.174795 -2.522832,-0.542468
                                        -3.684663,-1.199458c-0.680501,-0.385755 -0.879672,-0.283289
                                        -1.112038,0.518359c-0.199171,0.693154 -0.376212,1.392335
                                        -0.553253,2.091517c-0.237899,0.940279 -0.149378,1.163293
                                        0.674968,1.603295c1.05118,0.554523 2.174283,0.837812
                                        3.319516,1.036717c0.896269,0.156713 0.923932,0.198905
                                        0.934997,1.211513c0.005533,0.458084 0.005533,0.922196
                                        0.011065,1.380281c0.005533,0.578633 0.260029,0.916169
                                        0.807749,0.928224c0.619643,0.012055 1.244819,0.012055
                                        1.864462,-0.006027c0.508993,-0.012055 0.769021,-0.313426
                                        0.769021,-0.873977c0,-0.626852 0.027663,-1.259732
                                        0.005533,-1.886584c-0.027663,-0.638907 0.226834,-0.964388
                                        0.791151,-1.133156c1.300144,-0.385755 2.406649,-1.145211
                                        3.258659,-2.278367c2.367922,-3.134262 1.46612,-7.721133
                                        -1.886592,-9.740321z').click
		end

		it 'should search for a restaurant' do
			@browser.button(class: ["form-control", "table-button", "btn"]).click
		end

		it 'should open the restaurants page' do
			@browser.button(class: ["form-control", "reserve-button--list", "btn"]).click
		end

		it 'should choose the date in the past' do
			@browser.input(class: ["calendar-picker", "ember-view"]).to_subtype.clear
			@browser.input(class: ["calendar-picker", "ember-view"]).send_keys "December 01,2018"
		end

		it 'should find the table' do
			@browser.button(class: ["form-control", "find-table-button", "btn"]).click
		end

		it 'should close the warning window' do
			@browser.button(class: ["swal2-confirm", "swal2-styled"]).click
		end

		it 'should choose the good date' do
			@browser.input(class: ["calendar-picker", "ember-view"]).to_subtype.clear
			@browser.input(class: ["calendar-picker", "ember-view"]).send_keys "December 02,2019"
		end

		it 'should enter the time that is not valid' do
			@browser.element(class: "ember-power-select-status-icon").click
			@browser.input(class: "ember-power-select-search-input").send_keys "20:33"
		end

		it 'should check for the error message' do
			@error = @browser.li(class: ["ember-power-select-option", "ember-power-select-option--no-matches-message"]).wait_until_present
			expect(@error).to exist
		end

		it 'should delete time' do
			@browser.text_field(class: "ember-power-select-search-input").send_keys :backspace
			@browser.send_keys :backspace
			@browser.send_keys :backspace
			@browser.send_keys :backspace
			@browser.send_keys :backspace
		end
		it 'should enter valid time' do
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

	context 'when trying to make the same reservation again' do

		it 'should enter the same date' do
			@browser.input(class: ["calendar-picker", "ember-view"]).to_subtype.clear
			@browser.input(class: ["calendar-picker", "ember-view"]).send_keys "December 02,2019"
		end

		it 'should enter the same time' do
			@browser.element(class: "ember-power-select-status-icon").click
			@browser.input(class: "ember-power-select-search-input").send_keys "20:30"
			@browser.send_keys :enter
		end

		it 'should find the table' do
			@browser.button(class: ["form-control", "find-table-button", "btn"]).click
		end

		it 'should choose another time offered' do
			@browser.button(class: ["form-control", "suggested-reservation-button btn"]).click
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