require 'spec_helper'

describe IdeasController, type: :controller do 
	describe "GET #index" do
		
		it "renders the index view" do
			get :index
			expect(response).to render_template :index
		end
		
		it "shows a list if ideas" do 
			idea =  FactoryGirl.create(:idea)
			get :index
			expect(assigns(:ideas)).to eq([idea])
		end

	end

	describe "GET #show" do 
		
		before :each do 
			@idea = FactoryGirl.create(:idea)
			get :show, id: @idea.id
		end
		
		it "renders the show template" do 
			expect(response).to render_template(:show)
		end

		it "assigns the idea as @idea" do
			expect(assigns(:idea)).to eq(@idea)
		end

	end

	describe "GET #new" do 
		
		it "renders the new idea page" do 
			get :new
			expect(response).to render_template(:new)
		end

		it "assigns a new idea as @idea" do 
			get :new
			expect(assigns(:idea)).to be_a_new(Idea)
		end

	end

	describe "GET #edit" do 
		
		before :each do 
			@idea = FactoryGirl.create(:idea)
			get :edit, id: @idea.id
		end

		it "renders the edit idea page" do 
			expect(response).to render_template(:edit)
		end

		it "assigns a idea as @idea" do
			expect(assigns(:idea)).to eq(@idea)
		end

	end

	describe "POST #create" do 
		
		context "with valid attributes" do 
			it "saves the new idea into the database" do 
				expect{
					post(:create, idea: FactoryGirl.attributes_for(:idea))
				}.to change(Idea, :count).by(1)
			end

			it "redirects to the idea#show" do
				post(:create, idea: FactoryGirl.attributes_for(:idea))
				expect(response).to redirect_to Idea.last
			end
		end

		context "with invalid attributes" do 
			it "does not save the new idea into the database" do 
				expect{
					post :create, idea: FactoryGirl.attributes_for(:invalid_idea)
				}.to_not change(Idea, :count)
			end

			it "re-renders the :new template" do 
				post :create, idea: FactoryGirl.attributes_for(:invalid_idea)
				expect(response).to render_template(:new)
			end
		end
	end

	describe "PUT #update" do 
		context "with valid attributes" do 
			before :each do 
				@idea = FactoryGirl.create(:idea)
			end

			it "located the existing idea" do
				put :update, id: @idea.id, idea: FactoryGirl.attributes_for(:idea)
				expect(assigns(:idea)).to eq(@idea)
			end

			it "saves the updated idea into the database" do
				new_idea_hash = FactoryGirl.attributes_for(:idea)
				put :update, id: @idea.id, idea: new_idea_hash
				@idea.reload
				expect(@idea.name).to eq(new_idea_hash[:name])
			end

			it "redirects to the idea" do 
				put :update, id: @idea.id, idea: FactoryGirl.attributes_for(:idea)
				expect(response).to redirect_to(idea_path(id: @idea.id))
			end
		end

		context "with invalid attributes" do 
			before :each do 
				@idea = FactoryGirl.create(:idea)
			end

			it "locates the existing idea" do 
				put :update, id: @idea.id, idea: FactoryGirl.attributes_for(:invalid_idea)
				expect(assigns(:idea)).to eq(@idea)
			end

			it "does not save the updated idea into the database" do 
				new_invalid_idea = FactoryGirl.attributes_for(:invalid_idea)
				put :update, id: @idea.id, idea: new_invalid_idea
				@idea.reload
				expect(@idea.name).to_not eq(new_invalid_idea[:name])
			end

			it "re-renders the :edit template" do 
				put :update, id: @idea.id, idea: FactoryGirl.attributes_for(:invalid_idea)
				expect(response).to render_template(:edit)
			end
		end
	end

	describe "DELETE #destroy" do
		before :each do 
			@idea = FactoryGirl.create(:idea)
		end

		it "deletes the respective idea" do 
			expect{
				delete :destroy, id: @idea.id
			}.to change(Idea, :count).by(-1)
		end

		it "redirects to ideas#index" do 
      delete :destroy, id: @idea.id
      expect(response).to redirect_to ideas_path
		end
	end
end