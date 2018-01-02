require 'rails_helper'
describe "A user type in a zipcode" do 
  it "and receive a list of stores in a specified distance" do 
    visit '/'
    fill_in "search", with: "80202"
    click_on "Search"

    expect(page).to have_content("Cherry Creek")
    expect(page).to have_content("Location:")
    expect(page).to have_content("Phone Number:")
    expect(page).to have_content("Distance Away:")
    expect(page).to have_content("Store Type:")

    expect(page).to have_selector('h1', count: 10)
  end
end