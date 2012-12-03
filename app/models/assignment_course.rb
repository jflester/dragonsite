class AssignmentCourse < ActiveRecord::Base
  attr_accessible :assignment_id, :course_id
  
  belongs_to :assignment, class_name: "Assignment"
  belongs_to :course,     class_name: "Course"
  
  validates :assignment_id, presence: true
  validates :course_id,		presence: true
end
