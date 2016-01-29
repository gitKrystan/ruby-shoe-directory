require "spec_helper"

feature "Adding a brand" do
  scenario "allows the administrator to add a brand" do
    visit '/'
    click_link 'Admin'
    fill_in 'brand_name', with: 'Test Brand'
    click_button 'Add Brand'
    expect(page).to have_content 'Test Brand'
  end
end
