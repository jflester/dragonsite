class AssignmentsController < ApplicationController
  before_filter :signed_in_user
  
  def show
    @assignment = Assignment.find(params[:id])
  end

  def index
    @assignments = Assignment.paginate(page: params[:page])
  end

  def new
    @assignment = Assignment.new
	@course = Course.find(params[:course_id])
    #0.times do
    #  question = @assignment.questions.build
    #0.times { question.answers.build }
    #end
  end

  def create
    @assignment = Assignment.new(params[:assignment])
    if @assignment.save
      redirect_to @assignment, :notice => "Successfully created assignment."
    else
      render :action => 'new'
    end
  end

  def edit
    @assignment = Assignment.find(params[:id])
  end

  def update
    @assignment = Assignment.find(params[:id])
    if @assignment.update_attributes(params[:assignment])
      redirect_to @assignment
    else
      render :action => 'edit'
    end
  end

  def destroy
    @assignment.destroy
    redirect_to assignments_url, :notice => "Successfully destroyed assignment."
  end

  def report
  end

end
