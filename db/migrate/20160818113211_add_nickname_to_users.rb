class AddNicknameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :nickname, :string
    add_column :users, :gender, :integer
    add_column :users, :grade, :integer
  end
end
