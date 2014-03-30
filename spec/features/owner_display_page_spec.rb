require 'spec_helper'

feature "User creates an dog profile", %q{
  As a user/admin
  I want to view all of the other dog owners
  So that I can connect with the other dog owners
  } do

    it "Sees that the display page has the required content" do
      visit '/owners'
      expect(page).to have_content "Boston Dog Owners Society"
    end

    it "Sees the inputted owners on the owners page" do
      dog1 = Owner.create!(first_name: "Billy", last_name: "Thorton", dog_name: "Yeller", email: "asdf@gmail.com")
      dog2 = Owner.create!(first_name: "James", last_name: "Bond", dog_name: "Killer", email: "snipes@gmail.com")
      visit '/owners'
      expect(page).to have_content("Thorton")
      expect(page).to have_content("snipes@gmail.com")
      expect(page).to have_content dog1.last_name
      expect(page).to have_content dog2.first_name
      expect(page).to have_content dog2.full_name
      expect(page).to have_content dog1.full_name

    end


  it "sees a delete button" do
    dog1 = Owner.create!(first_name: "Billy", last_name: "Thorton", dog_name: "Yeller", email: "asdf@gmail.com")
    page.has_selector?('Destroy')
  end

  it "destroys one of the created dog owners when destory button clicked" do
    dog1 = Owner.create!(first_name: "Billy", last_name: "Thorton", dog_name: "Yeller", email: "asdf@gmail.com")
    visit '/owners'
    expect { click_link 'Destroy'  }.to change(Owner, :count).by(-1)
  end

  it "has an owners full name" do
    dog3 = Owner.create!(first_name: "Bruce", last_name: "theCrusher", dog_name: "Killer", email: "snipes@gmail.com")
    visit '/owners'
    expect(page).to have_content dog3.full_name
  end

end
