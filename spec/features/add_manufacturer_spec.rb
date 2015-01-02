require 'rails_helper'

feature 'Salesperson adds a new manufacturer', %Q{
  As a car salesperson
I want to record a car manufacturer
So that I can keep track of the types of cars found in the lot
  } do

#     Acceptance Criteria:
#
# I must specify a manufacturer name and country.
# If I do not specify the required information, I am presented with errors.
# If I specify the required information, the manufacturer is recorded and I am redirected to the index of manufacturers

  scenario 'with valid data' do
    manufacturer = FactoryGirl.create(:manufacturer)
    visit '/manufacturers/new'
    fill_in 'Name', with: manufacturer.name
    fill_in 'Country', with: manufacturer.country

    click_button 'Create manufacturer'

    expect(page).to have_content 'New manufacturer was successfully added'
    expect(page).to have_content manufacturer.name
    expect(page).to have_content manufacturer.country
  end

  scenario 'with invalid data' do
    visit '/manufacturers/new'

    click_button 'Create manufacturer'

    expect(page).to have_content "There was a problem"
    expect(page).to have_content "Name can't be blank"
    expect(page).to have_content "Country can't be blank"

  end
end
