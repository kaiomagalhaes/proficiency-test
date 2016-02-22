require 'rails_helper'

RSpec.describe GradesController, :type => :controller do

  let(:valid_attributes) {
    {student: create(:student), course: create(:course)}
  }

  let(:invalid_attributes) {
    {student: nil, course: nil}
  }

  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all grades as @grades" do
      grade = Grade.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:grades)).to eq([grade])
    end
  end

  describe "GET show" do
    it "assigns the requested grade as @grade" do
      grade = Grade.create! valid_attributes
      get :show, {:id => grade.to_param}, valid_session
      expect(assigns(:grade)).to eq(grade)
    end
  end

  describe "GET new" do
    it "assigns a new grade as @grade" do
      get :new, {}, valid_session
      expect(assigns(:grade)).to be_a_new(Grade)
    end
  end

  describe "GET edit" do
    it "assigns the requested grade as @grade" do
      skip
      grade = Grade.create! valid_attributes
      get :edit, {:id => grade.to_param}, valid_session
      expect(assigns(:grade)).to eq(grade)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Grade" do
        expect {
          post :create, {:grade => valid_attributes}, valid_session
        }.to change(Grade, :count).by(1)
      end

      it "assigns a newly created grade as @grade" do
        post :create, {:grade => valid_attributes}, valid_session
        expect(assigns(:grade)).to be_a(Grade)
        expect(assigns(:grade)).to be_persisted
      end

      it "redirects to the created grade" do
        post :create, {:grade => valid_attributes}, valid_session
        expect(response).to redirect_to(Grade.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved grade as @grade" do
        post :create, {:grade => invalid_attributes}, valid_session
        expect(assigns(:grade)).to be_a_new(Grade)
      end

      it "re-renders the 'new' template" do
        post :create, {:grade => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested grade" do
        grade = Grade.create! valid_attributes
        put :update, {:id => grade.to_param, :grade => new_attributes}, valid_session
        grade.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested grade as @grade" do
        grade = Grade.create! valid_attributes
        put :update, {:id => grade.to_param, :grade => valid_attributes}, valid_session
        expect(assigns(:grade)).to eq(grade)
      end

      it "redirects to the grade" do
        grade = Grade.create! valid_attributes
        put :update, {:id => grade.to_param, :grade => valid_attributes}, valid_session
        expect(response).to redirect_to(grade)
      end
    end

    describe "with invalid params" do
      it "assigns the grade as @grade" do
        skip
        grade = Grade.create! valid_attributes
        put :update, {:id => grade.to_param, :grade => invalid_attributes}, valid_session
        expect(assigns(:grade)).to eq(grade)
      end

      it "re-renders the 'edit' template" do
        skip
        grade = Grade.create! valid_attributes
        put :update, {:id => grade.to_param, :grade => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested grade" do
      grade = Grade.create! valid_attributes
      expect {
        delete :destroy, {:id => grade.to_param}, valid_session
      }.to change(Grade, :count).by(-1)
    end

    it "redirects to the grades list" do
      grade = Grade.create! valid_attributes
      delete :destroy, {:id => grade.to_param}, valid_session
      expect(response).to redirect_to(grades_url)
    end
  end

end
