require 'rails_helper'
RSpec.describe LineItemsController, type: :controller do

  let(:product) { create(:product, title: 'Burton Custom 505')}

  xdescribe "GET #index" do
    it "returns a success response" do
      LineItem.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: { line_items: { product_id: product.id } }
      expect(response).to be_successful
    end
  end

  xdescribe "GET #edit" do
    it "returns a success response" do
      line_item = LineItem.create! valid_attributes
      get :edit, params: {id: line_item.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      subject { post :create, params: { product_id: product.id } }

      it "creates a new LineItem" do
        expect {
          subject
        }.to change(LineItem, :count).by(1)
      end

      it "redirects to cart" do
        post :create, params: { product_id: product.id }
        expect(response).to redirect_to(assigns[:cart])
      end
    end
  end

  xdescribe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested line_item" do
        line_item = LineItem.create! valid_attributes
        put :update, params: {id: line_item.to_param, line_item: new_attributes}, session: valid_session
        line_item.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the line_item" do
        line_item = LineItem.create! valid_attributes
        put :update, params: {id: line_item.to_param, line_item: valid_attributes}, session: valid_session
        expect(response).to redirect_to(line_item)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        line_item = LineItem.create! valid_attributes
        put :update, params: {id: line_item.to_param, line_item: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  xdescribe "DELETE #destroy" do
    it "destroys the requested line_item" do
      line_item = LineItem.create! valid_attributes
      expect {
        delete :destroy, params: {id: line_item.to_param}, session: valid_session
      }.to change(LineItem, :count).by(-1)
    end

    it "redirects to the line_items list" do
      line_item = LineItem.create! valid_attributes
      delete :destroy, params: {id: line_item.to_param}, session: valid_session
      expect(response).to redirect_to(line_items_url)
    end
  end

end
