class AssignmentCoursesController < ApplicationController
  before_filter :signed_in_user
  
  def create
    @assignment = Assignment.find(params[:assignment_courses][:assignment_id])
	@course = Course.find(params[:assignment_courses][:course_id])
	@course.assassignment!(@assignment)
	@assignment.addcourse!(@course)
	redirect_to @assignment
  end
  
  def destroy
    @assignment = AssignmentCourse.find(params[:assignment_id]).assignment
	@course = AssignmentCourse.find(params[:course_id]).course
	@assignment.addcourse!(@course)
	@course.addassignment!(@user)
	redirect_to @course
  end
  
end