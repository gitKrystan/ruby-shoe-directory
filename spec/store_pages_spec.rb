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

feature "Updating a store" do
  before do
    create_test_store
  end

  scenario "allows the administrator to change a store" do
    visit '/admin'
    click_link 'Test Store'
    fill_in 'store_name', with: 'New Store Name'
    click_button 'Update Name'
    expect(page).to have_content 'New Store Name'
  end

  scenario "allows the administrator to delete a store" do
    visit '/admin'
    click_link 'Test Store'
    click_button 'Delete Store'
    expect(page).to have_content 'OUR STORES'
    expect(page).not_to have_content 'Test Store'
  end
end

feature "Connecting brands to a store" do
  before do
    create_test_store
    create_test_brand
  end

  scenario "allows the administrator to add a brand to a store" do
    visit '/admin'
    click_link 'Test Store'
    click_button 'Add Test Brand'
    expect(find('.store-brand-list')).to have_content 'Test Brand'
    expect(find('.add-brand-list')).not_to have_content 'Test Brand'
  end
end
