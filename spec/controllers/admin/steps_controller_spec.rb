require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.
#
# Also compared to earlier versions of this generator, there are no longer any
# expectations of assigns and templates rendered. These features have been
# removed from Rails core in Rails 5, but can be added back in via the
# `rails-controller-testing` gem.

RSpec.describe Admin::StepsController, type: :controller do
  include AdminAuthHelper

  before(:each) do
    admin_http_login
  end

  # This should return the minimal set of attributes required to create a valid
  # Step. As you add validations to Step, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    build(:step).attributes
  }

  let(:invalid_attributes) {
    build(:step, title: '').attributes
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # StepsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      step = Step.create!(valid_attributes)
      get :index, params: {journey_id: step.journey.id}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      journey = create(:journey)
      get :new, params: {journey_id: journey.id}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      step = Step.create! valid_attributes
      get :edit, params: {journey_id: step.journey.id, id: step.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Step" do
        journey = create(:journey)
        expect {
          post :create, params: {journey_id: journey.id, step: valid_attributes}, session: valid_session
        }.to change(Step, :count).by(1)
      end

      it "redirects to the created step" do
        journey = create(:journey)
        post :create, params: {journey_id: journey.id, step: valid_attributes}, session: valid_session
        step = Step.last
        expect(response).to redirect_to(admin_journey_steps_url(journey))
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        journey = create(:journey)
        post :create, params: {journey_id: journey.id, step: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {
            title: 'Foo bar'
        }
      }

      it "updates the requested step" do
        step = Step.create! valid_attributes
        put :update, params: {journey_id: step.journey.id, id: step.to_param, step: new_attributes}, session: valid_session
        step.reload
        expect(step.title).to eq new_attributes[:title]
      end

      it "redirects to the step" do
        step = Step.create! valid_attributes
        put :update, params: {journey_id: step.journey.id, id: step.to_param, step: valid_attributes}, session: valid_session
        expect(response).to redirect_to(admin_journey_steps_path(step.journey))
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        step = Step.create! valid_attributes
        put :update, params: {journey_id: step.journey.id, id: step.to_param, step: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested step" do
      step = Step.create! valid_attributes
      expect {
        delete :destroy, params: {journey_id: step.journey.id, id: step.to_param}, session: valid_session
      }.to change(Step, :count).by(-1)
    end

    it "redirects to the steps list" do
      step = Step.create! valid_attributes
      delete :destroy, params: {journey_id: step.journey.id, id: step.to_param}, session: valid_session
      expect(response).to redirect_to(admin_journey_steps_url(step.journey))
    end
  end

end
