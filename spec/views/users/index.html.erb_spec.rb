require 'rails_helper'

RSpec.describe "users/index", type: :view do
    before(:each) do
        user1 = FactoryBot.create(:user)
        user2 = FactoryBot.create(:user)
        @users = [user1, user2]
      binding.pry
    end
  
    it "renders a list of users" do
      render
      assert_select "tr>td", text: "name".to_s, count: 2
      assert_select "tr>td", text: "email".to_s, count: 2
      assert_select "tr>td", text: "password".to_s, count: 2
    end
  end
  