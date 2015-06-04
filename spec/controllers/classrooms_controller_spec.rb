require 'rails_helper'

RSpec.describe ClassroomsController, :type => :controller do

  let(:valid_attributes) {
    {student: create(:student), course: create(:course)}
  }

  let(:invalid_attributes) {
    {student: nil, course: nil}
  }

  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all classrooms as @classrooms" do
      classroom = Classroom.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:classrooms)).to eq([classroom])
    end
  end

  describe "GET show" do
    it "assigns the requested classroom as @classroom" do
      classroom = Classroom.create! valid_attributes
      get :show, {:id => classroom.to_param}, valid_session
      expect(assigns(:classroom)).to eq(classroom)
    end
  end

  describe "GET new" do
    it "assigns a new classroom as @classroom" do
      get :new, {}, valid_session
      expect(assigns(:classroom)).to be_a_new(Classroom)
    end
  end

  describe "GET edit" do
    it "assigns the requested classroom as @classroom" do
      classroom = Classroom.create! valid_attributes
      get :edit, {:id => classroom.to_param}, valid_session
      expect(assigns(:classroom)).to eq(classroom)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Classroom" do
        expect {
          post :create, {:classroom => valid_attributes}, valid_session
        }.to change(Classroom, :count).by(1)
      end

      it "assigns a newly created classroom as @classroom" do
        post :create, {:classroom => valid_attributes}, valid_session
        expect(assigns(:classroom)).to be_a(Classroom)
        expect(assigns(:classroom)).to be_persisted
      end

      it "redirects to the created classroom" do
        post :create, {:classroom => valid_attributes}, valid_session
        expect(response).to redirect_to(Classroom.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved classroom as @classroom" do
        post :create, {:classroom => invalid_attributes}, valid_session
        expect(assigns(:classroom)).to be_a_new(Classroom)
      end

      it "re-renders the 'new' template" do
        post :create, {:classroom => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do

      let(:new_student) {
        student = build(:student)
        student.register_number = 27
        student.save
        student
      }

      let(:new_course) {
        course = build(:course)
        course.description = "new description"
        course.save
        course
      }

      let(:new_attributes) {
        {student: new_student, course: new_course}
      }

      let(:new_attributes) {
        {student: new_student, course: new_course}
      }

      it "updates the requested classroom" do
        classroom = Classroom.create! valid_attributes
        put :update, {:id => classroom.to_param, :classroom => new_attributes}, valid_session
        retrieved_classroom = assigns(:classroom)
        expect(retrieved_classroom[:student_id]).to eq(new_student.id)
        expect(retrieved_classroom[:course_id]).to eq(new_course.id)
      end

      it "assigns the requested classroom as @classroom" do
        classroom = Classroom.create! valid_attributes
        put :update, {:id => classroom.to_param, :classroom => valid_attributes}, valid_session
        expect(assigns(:classroom)).to eq(classroom)
      end

      it "redirects to the classroom" do
        classroom = Classroom.create! valid_attributes
        put :update, {:id => classroom.to_param, :classroom => valid_attributes}, valid_session
        expect(response).to redirect_to(classroom)
      end
    end

    describe "with invalid params" do
      it "assigns the classroom as @classroom" do
        classroom = Classroom.create! valid_attributes
        put :update, {:id => classroom.to_param, :classroom => invalid_attributes}, valid_session
        expect(assigns(:classroom)).to eq(classroom)
      end

      it "re-renders the 'edit' template" do
        classroom = Classroom.create! valid_attributes
        put :update, {:id => classroom.to_param, :classroom => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested classroom" do
      classroom = Classroom.create! valid_attributes
      expect {
        delete :destroy, {:id => classroom.to_param}, valid_session
      }.to change(Classroom, :count).by(-1)
    end

    it "redirects to the classrooms list" do
      classroom = Classroom.create! valid_attributes
      delete :destroy, {:id => classroom.to_param}, valid_session
      expect(response).to redirect_to(classrooms_url)
    end
  end

end
