class ClassroomsController < ApplicationController
  before_action :set_classroom, only: [:show, :edit, :update, :destroy]


  def index
    @classrooms = Classroom.all
  end


  def show
  end

  def new
    @classroom = Classroom.new
  end

  def edit
  end

  def create
    @classroom = Classroom.new(classroom_params)

    respond_to do |format|
      if @classroom.save
        format.html { redirect_to @classroom, notice: 'Classroom was successfully created.' }
        format.json { render action: 'show', status: :created, location: @classroom }
      else
        format.html { render action: 'new' }
        format.json { render json: @classroom.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @classroom.update(classroom_params)
        format.html { redirect_to @classroom, notice: 'Classroom was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @classroom.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @classroom.destroy
    respond_to do |format|
      format.html { redirect_to classrooms_url }
      format.json { head :no_content }
    end
  end

  private
  def set_classroom
    @classroom = Classroom.find(params[:id])
  end

  def classroom_params
    valid_params = params.require(:classroom).permit(:student, :course)
    student = Student.find_by_id(valid_params[:student])
    course = Course.find_by_id(valid_params[:course])
    {student: student, course: course}
  end
end
