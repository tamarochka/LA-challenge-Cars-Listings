require 'rails_helper'

feature 'Salesperson adds a new car', %Q{
  As a car salesperson
I want to record a newly acquired car
So that I can list it in my lot
  } do

# Acceptance Criteria:
#
# I must specify the manufacturer, color, year, and mileage of the car (an association between the car and an existing manufacturer should be created).
# Only years from 1920 and above can be specified.
# I can optionally specify a description of the car.
# If I enter all of the required information in the required formats, the car is recorded and I am presented with a notification of success.
# If I do not specify all of the required information in the required formats, the car is not recorded and I am presented with errors.
# Upon successfully creating a car, I am redirected back to the index of cars.


  scenario 'with valid data' do
    car = FactoryGirl.create(:car)
    visit '/cars/new'

    fill_in 'Manufacturer', with: car.manufaturer.name
    fill_in 'Color', with: car.color
    select(2, :from => "Year")
    fill_in "Mileage", with: car.mileage
    fill_in "Description", with: car.description

    click_button 'Add car'

    expect(page).to have_content 'New car was successfully added'
    expect(page).to have_content car.manufacturer.name
    expect(page).to have_content car.color
  end

  scenario 'with invalid data' do
    visit '/cars/new'

    click_button 'Add car'

    expect(page).to have_content "Manufacturer can't be blank"
    expect(page).to have_content "Color can't be blank"
    expect(page).to have_content "Year can't be blank"
    expect(page).to have_content "Mileage can't be blank"

  end
end
