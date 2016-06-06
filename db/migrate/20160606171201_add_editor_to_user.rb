class AddEditorToUser < ActiveRecord::Migration
  def change
    add_column :users, :editor, :boolean, null: false, default: :false
  end
end
