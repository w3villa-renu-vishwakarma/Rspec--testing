require 'rails_helper'

RSpec.describe User, type: :model do
    describe "User model validation" do
      context "when testing user model" do
            it "valid with valid attributes" do
                user = FactoryBot.build(:user)
                expect(user).to be_valid 
            end

            it "not valid without a name" do
                user = User.new(name: nil)
                expect(user).to_not be_valid  
            end

            it "not valid without an email" do
                user = User.new(email: nil)
                expect(user).to_not be_valid  
            end

            it "not valid without password" do
                user = User.new(password: nil)
                expect(user).to_not be_valid
            end
       
      end
    end
    
end
