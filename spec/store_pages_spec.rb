require "spec_helper"

feature "Adding a store" do
  scenario "allows the administrator to add a store" do
    visit '/'
    click_link 'Admin'
    fill_in 'store_name', with: 'Test Store'
    click_button 'Add Store'
    expect(page).to have_content 'Test Store'
  end
end
