class Student < ActiveRecord::Base
  
  
 validates :first_name, presence: true
 validates :last_name, presence: true
 validates :email, presence: true
 validates :age, presence: true
  
 #This method is for achive active interaction.
  def self.full_name student
   @student_full_name="#{student.first_name} "  "#{student.last_name}"
   return @student_full_name
  end
 
 #This method is for achiving student filtretion.
  def self.find_students_with_specific_age(age)
   @students = where('age = ?',age)
   return @students
  end
  
  
  
end
