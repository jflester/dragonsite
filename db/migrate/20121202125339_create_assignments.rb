class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.string :name
      t.datetime :due_date
      t.integer :total_points
      t.boolean :published, default: false
      t.integer :course_id

      t.timestamps
    end
	add_index :assignments, :name
	add_index :assignments, :course_id
  end
end
