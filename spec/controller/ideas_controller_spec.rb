require 'spec_helper'

describe IdeasController do 
	describe "GET #index" do 
		it "renders the index view"
		it "shows a list if ideas"
	end

	describe "GET #show" do 
		it "renders the show template"
		it "assigns the idea as @idea"
	end

	describe "GET #new" do 
		it "renders the new idea page"
		it "assigns a new idea as @idea"
	end

	describe "GET #edit" do 
		it "renders the edit idea page"
		it "assigns a idea as @idea"
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