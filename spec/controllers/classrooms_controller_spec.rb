require 'rails_helper'

RSpec.describe ClassroomsController, type: :controller do
  let(:valid_attributes) {
    { student: create(:student), course: create(:course) }
  }

  let(:invalid_attributes) {
    { student: nil, course: nil }
  }

  let(:valid_session) { {} }

  describe 'GET index' do
    it 'assigns all classrooms as @classrooms' do
      classroom = Classroom.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:classrooms)).to eq([classroom])
    end
  end

  describe 'GET show' do
    it 'assigns the requested classroom as @classroom' do
      classroom = Classroom.create! valid_attributes
      get :show, { id: classroom.to_param }, valid_session
      expect(assigns(:classroom)).to eq(classroom)
    end
  end

  describe 'GET new' do
    it 'assigns a new classroom as @classroom' do
      get :new, {}, valid_session
      expect(assigns(:classroom)).to be_a_new(Classroom)
    end
  end

  describe 'POST create' do
    describe 'with valid params' do
      it 'creates a new Classroom' do
        expect {
          post :create, { classroom: valid_attributes }, valid_session
        }.to change(Classroom, :count).by(1)
      end

      it 'assigns a newly created classroom as @classroom' do
        post :create, { classroom: valid_attributes }, valid_session
        expect(assigns(:classroom)).to be_a(Classroom)
        expect(assigns(:classroom)).to be_persisted
      end

      it 'redirects to the created classroom' do
        post :create, { classroom: valid_attributes }, valid_session
        expect(response).to redirect_to(Classroom.last)
      end
    end

    describe 'with invalid params' do
      it 'assigns a newly created but unsaved classroom as @classroom' do
        post :create, { classroom: invalid_attributes }, valid_session
        expect(assigns(:classroom)).to be_a_new(Classroom)
      end

      it "re-renders the 'new' template" do
        post :create, { classroom: invalid_attributes }, valid_session
        expect(response).to render_template('new')
      end
    end
  end

  describe 'DELETE destroy' do
    it 'destroys the requested classroom' do
      classroom = Classroom.create! valid_attributes
      expect {
        delete :destroy, { id: classroom.to_param }, valid_session
      }.to change(Classroom, :count).by(-1)
    end

    it 'redirects to the classrooms list' do
      classroom = Classroom.create! valid_attributes
      delete :destroy, { id: classroom.to_param }, valid_session
      expect(response).to redirect_to(classrooms_url)
    end
  end
end
