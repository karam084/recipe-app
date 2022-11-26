require 'rails_helper'

RSpec.describe '/recipe_foods', type: :request do
  let(:valid_attributes) do
    skip('Add a hash of attributes valid for your model')
  end

  let(:invalid_attributes) do
    skip('Add a hash of attributes invalid for your model')
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Recipefood.create! valid_attributes
      get recipe_foods_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      recipe_food = Recipefood.create! valid_attributes
      get recipe_food_url(recipe_food)
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'renders a successful response' do
      recipe_food = Recipefood.create! valid_attributes
      get edit_recipe_food_url(recipe_food)
      expect(response).to be_successful
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        skip('Add a hash of attributes valid for your model')
      end

      it 'updates the requested recipe_food' do
        recipe_food = Recipefood.create! valid_attributes
        patch recipe_food_url(recipe_food), params: { recipe_food: new_attributes }
        recipe_food.reload
        skip('Add assertions for updated state')
      end

      it 'redirects to the recipe_food' do
        recipe_food = Recipefood.create! valid_attributes
        patch recipe_food_url(recipe_food), params: { recipe_food: new_attributes }
        recipe_food.reload
        expect(response).to redirect_to(recipe_food_url(recipe_food))
      end
    end

    context 'with invalid parameters' do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        recipe_food = Recipefood.create! valid_attributes
        patch recipe_food_url(recipe_food), params: { recipe_food: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested recipe_food' do
      recipe_food = Recipefood.create! valid_attributes
      expect do
        delete recipe_food_url(recipe_food)
      end.to change(Recipefood, :count).by(-1)
    end

    it 'redirects to the recipe_foods list' do
      recipe_food = Recipefood.create! valid_attributes
      delete recipe_food_url(recipe_food)
      expect(response).to redirect_to(recipe_foods_url)
    end
  end
end
