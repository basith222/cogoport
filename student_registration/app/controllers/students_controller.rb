class StudentsController < ApplicationController
  respond_to :html, :js, :json
  
  def index
    @students = Student.all
  end
  
  def new
    @age =(1..100).to_a
    @student = Student.new
  end
  
  def show
    @student = Student.find(params[:id])
  end
  
   def edit
    @age =(1..100).to_a
    @student = Student.find(params[:id])
   end
 
  def create
    @student = Student.new(student_params)
    if @student.save  
      respond_to do |format|
        format.html{redirect_to student_path(@student)}
        format.js{redirect_to student_path(@student)}
        end
      else
        respond_to do |format|
        format.html{redirect_to students_new_path}
        format.js{redirect_to students_new_path}
        end
      end
  end  
  
  def update
      @student = Student.find(params[:id])
      if @student.update(student_params)  
      respond_to do |format|
        format.html{redirect_to student_path(@student)}
        format.js{redirect_to student_path(@student)}
        end
      else
        respond_to do |format|
        format.html{redirect_to edit_student_path(@student.id)}
        format.js{redirect_to edit_student_path(@student.id)}
        end
      end
    
  end
  
  def destroy
    @student = Student.find(params[:id])
    @student.destroy
    redirect_to students_path
  end
  
  def get_student
    @age = params[:age]
    @students_with_filterd_age = Student.find_students_with_specific_age(@age)
  end
  
  
 private
    
  def student_params
    params.require(:student).permit(:first_name, :last_name , :email , :age , :phone_number,:gender)
  end
  
  
end
