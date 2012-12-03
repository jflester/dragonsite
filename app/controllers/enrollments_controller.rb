class EnrollmentsController < ApplicationController
  before_filter :signed_in_user
  respond_to :html, :js
  
  def create
    @user = User.find(params[:enrollment][:user_id])
	@course = Course.find(params[:enrollment][:course_id])
	current_user.enroll!(@course)
	respond_with @course
  end
  
  def destroy
    @user = Enrollment.find(params[:id]).user
	@course = Enrollment.find(params[:id]).course
	current_user.unenroll!(@course)
	respond_with @course
  end
  
end