class AddCelebToUser < ActiveRecord::Migration
  def change
    add_column :users, :celeb, :boolean, null: :false, default: :false
  end
end
