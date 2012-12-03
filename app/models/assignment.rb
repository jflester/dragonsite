class Assignment < ActiveRecord::Base
  attr_accessible :name, :due_date, :total_points, :published, :course_id
  
  has_many :courses
  has_many :assignmentcourses, foreign_key: "assignment_id", dependent: :destroy
  has_many :assignment_for_courses, through: :assignmentcourses, source: :course
  
  validates :name, presence: true, length: { maximum: 50 }
  validates :due_date, presence: true
  
  def hascourse?(this_course)
    assignmentcourses.find_by_course_id(this_course.id)
  end
  
  def addcourse!(this_course)
    self.assignmentcourses.create!(course_id: this_course.id)
  end
  
  def removecourse!(this_course)
    self.assignmentcourses.find_by_course_id(this_course.id).destroy
  end
  
end
