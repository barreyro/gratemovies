require 'rails_helper'


describe ReviewsController do

 describe 'GET #index' do
   it "populates an array of reviews" do
      review1 = FactoryGirl.create(:review)
      review2 = FactoryGirl.create(:review)
      get :index
      expect(:reviews).not_to be_empty
   end

   it "renders the :index template" do
      get :index
      expect(response).to render_template :index
   end
 end

 describe 'GET #show' do
    it "assigns the requested review to @review" do
       review = FactoryGirl.create(:review)
       get :show, id: review
       expect(assigns(:review)).to eq review
    end

    it "renders the :show template" do
       review = FactoryGirl.create(:review)
       get :show, id: review
       expect(response).to render_template :show
    end
 end

 describe 'GET #new' do
    it "assigns a new Review to @review" do
      get :new
      expect(assigns(:review)).to be_a_new(Review)
    end

    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
 end

 describe "POST #create" do

   context "with valid attributes" do
      it "saves the new review in the database" do
        expect{
          post :create,
           review: FactoryGirl.attributes_for(:review)
        }.to change(Review, :count).by(1)
      end

      it "redirects to reviews#show" do
         post :create,
          review: FactoryGirl.attributes_for(:review)
         expect(response).to redirect_to review_path(assigns[:review])
      end
   end

   context "with invalid attributes" do
      it "does not save the new review in the database" do
          expect{
            post :create,
            review: FactoryGirl.attributes_for(:invalid_review)
          }.to_not change(Review, :count)
      end

      it "re-renders the :new template" do
          post :create,
            review: FactoryGirl.attributes_for(:invalid_review)
          expect(response).to render_template :new
      end
   end
 end
end
