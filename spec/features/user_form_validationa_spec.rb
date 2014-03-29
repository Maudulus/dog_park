require 'spec_helper'

feature "User creates an dog profile", %q{
  As a user
  I want to create a dog profile
  So that I can connect with other dog owners
  } do


    context "with valid attributes " do
      it 'requires a first name' do
        dog_owner = Owner.create(last_name: "Willcox", dog_name: "Brutus", email: "doglover@gmail.com")
        expect(dog_owner).to_not be_valid
        expect(dog_owner.errors[:first_name]).to be_present
      end
      it 'requires a last name' do
        dog_owner = Owner.create(first_name: "Willcox", dog_name: "Brutus", email: "doglover@gmail.com")
        expect(dog_owner).to_not be_valid
        expect(dog_owner.errors[:last_name]).to be_present
      end
      it 'requires a dog name' do
        dog_owner = Owner.create(first_name: "Terrence",last_name: "Willcox", email: "doglover@gmail.com")
        expect(dog_owner).to_not be_valid
        expect(dog_owner.errors[:dog_name]).to be_present
      end
      it 'requires an email' do
      dog_owner = Owner.create(first_name: "Terrence",last_name: "Willcox", dog_name: "Brutus")
      expect(dog_owner.errors[:email]).to be_present
      end
    end
  end


