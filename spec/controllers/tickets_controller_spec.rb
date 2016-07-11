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

RSpec.describe TicketsController, type: :controller do
  # This should return the minimal set of attributes required to create a valid
  # Ticket. As you add validations to Ticket, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    skip('Add a hash of attributes valid for your model')
  end

  let(:invalid_attributes) do
    skip('Add a hash of attributes invalid for your model')
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # TicketsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'assigns all tickets as @tickets' do
      ticket = Ticket.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:tickets)).to eq([ticket])
    end
  end

  describe 'GET #show' do
    it 'assigns the requested ticket as @ticket' do
      ticket = Ticket.create! valid_attributes
      get :show, { id: ticket.to_param }, valid_session
      expect(assigns(:ticket)).to eq(ticket)
    end
  end

  describe 'GET #new' do
    it 'assigns a new ticket as @ticket' do
      get :new, {}, valid_session
      expect(assigns(:ticket)).to be_a_new(Ticket)
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested ticket as @ticket' do
      ticket = Ticket.create! valid_attributes
      get :edit, { id: ticket.to_param }, valid_session
      expect(assigns(:ticket)).to eq(ticket)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Ticket' do
        expect do
          post :create, { ticket: valid_attributes }, valid_session
        end.to change(Ticket, :count).by(1)
      end

      it 'assigns a newly created ticket as @ticket' do
        post :create, { ticket: valid_attributes }, valid_session
        expect(assigns(:ticket)).to be_a(Ticket)
        expect(assigns(:ticket)).to be_persisted
      end

      it 'redirects to the created ticket' do
        post :create, { ticket: valid_attributes }, valid_session
        expect(response).to redirect_to(Ticket.last)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved ticket as @ticket' do
        post :create, { ticket: invalid_attributes }, valid_session
        expect(assigns(:ticket)).to be_a_new(Ticket)
      end

      it "re-renders the 'new' template" do
        post :create, { ticket: invalid_attributes }, valid_session
        expect(response).to render_template('new')
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        skip('Add a hash of attributes valid for your model')
      end

      it 'updates the requested ticket' do
        ticket = Ticket.create! valid_attributes
        put :update, { id: ticket.to_param, ticket: new_attributes }, valid_session
        ticket.reload
        skip('Add assertions for updated state')
      end

      it 'assigns the requested ticket as @ticket' do
        ticket = Ticket.create! valid_attributes
        put :update, { id: ticket.to_param, ticket: valid_attributes }, valid_session
        expect(assigns(:ticket)).to eq(ticket)
      end

      it 'redirects to the ticket' do
        ticket = Ticket.create! valid_attributes
        put :update, { id: ticket.to_param, ticket: valid_attributes }, valid_session
        expect(response).to redirect_to(ticket)
      end
    end

    context 'with invalid params' do
      it 'assigns the ticket as @ticket' do
        ticket = Ticket.create! valid_attributes
        put :update, { id: ticket.to_param, ticket: invalid_attributes }, valid_session
        expect(assigns(:ticket)).to eq(ticket)
      end

      it "re-renders the 'edit' template" do
        ticket = Ticket.create! valid_attributes
        put :update, { id: ticket.to_param, ticket: invalid_attributes }, valid_session
        expect(response).to render_template('edit')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested ticket' do
      ticket = Ticket.create! valid_attributes
      expect do
        delete :destroy, { id: ticket.to_param }, valid_session
      end.to change(Ticket, :count).by(-1)
    end

    it 'redirects to the tickets list' do
      ticket = Ticket.create! valid_attributes
      delete :destroy, { id: ticket.to_param }, valid_session
      expect(response).to redirect_to(tickets_url)
    end
  end
end
