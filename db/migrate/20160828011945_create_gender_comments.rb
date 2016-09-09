class CreateGenderComments < ActiveRecord::Migration
  def change
    create_table :gender_comments do |t|
      t.integer :user_id
      t.integer :gender_id
      t.text :text
      t.timestamps
    end
  end
end
