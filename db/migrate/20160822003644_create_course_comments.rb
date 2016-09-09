class CreateCourseComments < ActiveRecord::Migration
  def change
    create_table :course_comments do |t|
      t.integer :user_id
      t.integer :course_id
      t.text :text
      t.timestamps
    end
  end
end
