require 'rails_helper'
RSpec.describe Article, type: :model do
	before :all do
	 	@user = FactoryBot.create(:user)
        @article = FactoryBot.create(:article)
	end
 	describe "#Association" do
 		 it "belong to user " do
          	assc = Article.reflect_on_association(:user)
          	expect(assc.macro).to eq :belongs_to
        end
 	end
end





