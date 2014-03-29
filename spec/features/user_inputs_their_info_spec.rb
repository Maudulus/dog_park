require 'spec_helper'
feature "User inputs their information", %q{
  As a User
  I want to input my dog information
  So that I can connect with other dog owners
  } do

    context "with valid attributes" do
      it "creates a contact submission " do
        visit '/owners/new'

        fill_in "owner_first_name", with: "John"
        fill_in "owner_last_name", with: "McGreggor"
        fill_in "owner_dog_name", with: "Spot"
        fill_in "Email", with: "jmcgreggor@gmail.com"
        click_on "Create Owner"

        expect(page).to have_content "Owner was successfully created"
      end

    it "gives an error when not passed the last_name field" do
      visit '/owners/new'

      fill_in "owner_first_name", with: "John"
      fill_in "owner_dog_name", with: "You're the best!"
      fill_in "Email", with: "jmcgreggor@gmail.com"
      click_on "Create Owner"

      expect(page).to have_content "Last name can't be blank"
    end

    it "gives an error when not passed the dog_name field" do
      visit '/owners/new'

      fill_in "owner_first_name", with: "John"
      fill_in "owner_last_name", with: "McGreggor"
      fill_in "Email", with: "jmcgreggor@gmail.com"
      click_on "Create Owner"

      expect(page).to have_content "Dog name can't be blank"
    end

    it "gives an error when not passed the email field" do
      visit '/owners/new'

      fill_in "owner_first_name", with: "John"
      fill_in "owner_last_name", with: "McGreggor"
      fill_in "owner_dog_name", with: "You're the best!"
      click_on "Create Owner"

      expect(page).to have_content "Email can't be blank"
    end

  end
end
