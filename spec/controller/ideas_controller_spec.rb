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
			
			it "saves the new idea into the database"

			it "redirects to the idea"

		end
		context "with invalid attributes" do 
			it "does not save the new idea into the database"
			it "re-renders the :new template"
		end
	end

	describe "PUT #update" do 
		context "with valid attributes" do 
			it "saves the updated idea into the database"
			it "redirects to the idea"
		end
		context "with invalid attributes" do 
			it "does not save the updated idea into the database"
			it "re-renders the :edit template"
		end
	end

	describe "DELETE #destroy" do
		it "deletes the respective idea" do 
		end
	end
end