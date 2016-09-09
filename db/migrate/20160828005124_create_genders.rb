class CreateGenders < ActiveRecord::Migration
  def change
    create_table :genders do |t|
      t.string :title
      t.text :content
      t.timestamps
    end
  end
end
