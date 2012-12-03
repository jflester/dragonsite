class CreateAssignmentCourses < ActiveRecord::Migration
  def change
    create_table :assignment_courses do |t|
      t.integer :assignment_id
      t.integer :course_id

      t.timestamps
    end
	add_index :assignment_courses, :assignment_id
	add_index :assignment_courses, :course_id
	add_index :assignment_courses, [:course_id, :assignment_id], unique: true
  end
end
