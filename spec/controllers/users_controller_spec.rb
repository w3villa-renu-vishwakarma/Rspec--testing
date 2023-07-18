require 'rails_helper'

RSpec.describe UsersController, type: :controller do
    before(:each) do
        @user1 = FactoryBot.create(:user)
        @article = FactoryBot.create(:article)
    end
    describe "GET #index" do
        before do
            get :index
            user2 = FactoryBot.create(:user)            
        end
            it "renders index template" do
                expect(response).to render_template(:index) 
            end

            it "show list of all users" do
                expect(assigns[:users]).to eq(User.all) 
            end    
    end

    describe "GET #new" do
        before do
            get :new
        end

        it "renders new template" do
            expect(response).to render_template(:new) 
        end

        it "create a new user in the USER table" do
            user = FactoryBot.create(:user)
            expect(assigns[:user]).to be_instance_of(User)             
        end       
    end

    describe "POST #create" do
        

        context "when params are correct" do
            before do
            post :create, params: { user: FactoryBot.attributes_for(:user)}
         end
           
            it "get correct parameters and create new user successfully" do
                expect(assigns[:user]).to be_instance_of(User)
            end

            it "have a name" do
                expect(assigns[:user].name).to_not be_nil
            end
            
            it "have an email" do
                expect(assigns[:user].email).to_not be_nil
            end
            
            it "have a password" do
                expect(assigns[:user].password).to_not be_nil
            end

            it "redirect to users path" do
                expect(response).to redirect_to(user_path(assigns[:user]))
            end

            it "show flash message" do
                expect(flash[:notice]).to eq('User was successfully created.')
            end
            
            
        end

        context "when params are incorrect" do
            before do
            post :create, params: { user: { name: ''}}
          end

          it "render new template" do
            expect(response).to render_template(:new) 
          end
          
          it "add error to attribute" do
            expect(assigns[:user].errors[:name]).to eq(['can\'t be blank']) 
          end
          
        end
        
        
    end
     
    describe "GET #edit" do
        let(:user) { FactoryBot.create(:user) }
        let(:params) { { id: user.id } }
      
        before do
          get :edit, params: params
        end

          it "finds the user" do
            expect(assigns[:user]).to eq(User.find_by(id: params[:id])) 
          end

          it "renders edit template" do
            expect(response).to render_template(:edit) 
          end
             
    end
     
    describe "PATCH #update" do     
        before do
          patch :update, params: params
        end


        
            let(:user) { FactoryBot.create :user }
            let(:params) { { id: user.id, user: { name: 'updated name'} } }
            context "when data is valid" do
                it 'is expected to update user' do
                        expect(user.reload.name).to eq('updated name')  
                end
            
                it "it redirects to users path" do
                    expect(response).to redirect_to(user_path(assigns[:user]))
                end

                it "show flash message" do
                    expect(flash[:notice]).to eq('User was successfully updated.')
                end
            end

            context "when data invalid" do
                let(:user) { FactoryBot.create :user }
                let(:params) { { id: user.id, user: { name: ''} } }  
                it 'is expected not to update' do
                    expect(user.reload.name).to_not be_empty  
                end

                it 'is expected to show error' do
                    expect(assigns[:user].errors[:name]).to eq(['can\'t be blank']) 
                end

            end
        
    end
    #  For destroy

    describe "DELETE #destroy" do
    
        before do
            delete :destroy , params: params
                 
        end
        let(:user) { FactoryBot.create :user }
        let(:params) { { id: user.id } }
        it "show the flash message" do
            expect(flash[:notice]).to eq('User was successfully destroyed.')
        end
    end
      
    
    
    
end
