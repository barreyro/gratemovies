require 'rails_helper'


describe ReviewsController do

 describe 'GET #index' do
   it "populates an array of reviews"
   it "renders the :index template"
 end

 describe 'GET #show' do
    it "assigns the requested review to @review"
    it "renders the :show template"
 end

 describe 'GET #new' do
    it "assigns a new Review to @review"
    it "renders the :new template"
 end

 describe "POST #create" do
   context "with valid attributes" do
      it "saves the new review in the database"
      it "redirects to reviews#show"
   end

   context "with invalid attributes" do
      it "does not save the new review in the database"
      it "re-renders the :new template"
   end
 end
end