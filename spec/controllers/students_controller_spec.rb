require 'rails_helper'

RSpec.describe StudentsController, type: :controller do
  let(:valid_attributes) {
    { name: FFaker::Name.name, register_number: 1 }
  }

  let(:invalid_attributes) {
    { name: nil, register_number: nil }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # StudentsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe 'GET index' do
    it 'assigns all students as @students' do
      student = Student.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:students)).to eq([student])
    end
  end

  describe 'GET show' do
    it 'assigns the requested student as @student' do
      student = Student.create! valid_attributes
      get :show, { id: student.to_param }, valid_session
      expect(assigns(:student)).to eq(student)
    end
  end

  describe 'GET new' do
    it 'assigns a new student as @student' do
      get :new, {}, valid_session
      expect(assigns(:student)).to be_a_new(Student)
    end
  end

  describe 'GET edit' do
    it 'assigns the requested student as @student' do
      student = Student.create! valid_attributes
      get :edit, { id: student.to_param }, valid_session
      expect(assigns(:student)).to eq(student)
    end
  end

  describe 'POST create' do
    describe 'with valid params' do
      it 'creates a new Student' do
        expect {
          post :create, { student: valid_attributes }, valid_session
        }.to change(Student, :count).by(1)
      end

      it 'assigns a newly created student as @student' do
        post :create, { student: valid_attributes }, valid_session
        expect(assigns(:student)).to be_a(Student)
        expect(assigns(:student)).to be_persisted
      end

      it 'redirects to the created student' do
        post :create, { student: valid_attributes }, valid_session
        expect(response).to redirect_to(Student.last)
      end
    end

    describe 'with invalid params' do
      it 'assigns a newly created but unsaved student as @student' do
        post :create, { student: invalid_attributes }, valid_session
        expect(assigns(:student)).to be_a_new(Student)
      end

      it 're-renders the "new" template' do
        post :create, { student: invalid_attributes }, valid_session
        expect(response).to render_template('new')
      end
    end
  end

  describe 'PUT update' do
    describe 'with valid params' do
      let(:new_name) {
        'User test name'
      }

      let(:new_register_number) {
        '2'
      }

      let(:new_attributes) {
        { name: new_name, register_number: new_register_number }
      }

      it 'updates the requested student' do
        student = Student.create! valid_attributes
        put :update, { id: student.to_param, student: new_attributes }, valid_session
        student.reload
        response_student = assigns(:student)
        expect(response_student.register_number).to eql(new_register_number)
        expect(response_student.name).to eql(new_name)
      end

      it 'assigns the requested student as @student' do
        student = Student.create! valid_attributes
        put :update, { id: student.to_param, student: valid_attributes }, valid_session
        expect(assigns(:student)).to eq(student)
      end

      it 'redirects to the student' do
        student = Student.create! valid_attributes
        put :update, { id: student.to_param, student: valid_attributes }, valid_session
        expect(response).to redirect_to(student)
      end
    end

    describe 'with invalid params' do
      it 'assigns the student as @student' do
        student = Student.create! valid_attributes
        put :update, { id: student.to_param, student: invalid_attributes }, valid_session
        expect(assigns(:student)).to eq(student)
      end

      it 're-renders the "edit" template' do
        student = Student.create! valid_attributes
        put :update, { id: student.to_param, student: invalid_attributes }, valid_session
        expect(response).to render_template('edit')
      end
    end
  end

  describe 'DELETE destroy' do
    it 'destroys the requested student' do
      student = Student.create! valid_attributes
      expect {
        delete :destroy, { id: student.to_param }, valid_session
      }.to change(Student, :count).by(-1)
    end

    it 'redirects to the students list' do
      student = Student.create! valid_attributes
      delete :destroy, { id: student.to_param }, valid_session
      expect(response).to redirect_to(students_url)
    end
  end
end
