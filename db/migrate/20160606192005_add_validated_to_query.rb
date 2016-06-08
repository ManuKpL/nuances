class AddValidatedToQuery < ActiveRecord::Migration
  def change
    add_column :queries, :validated, :boolean, null: :false, default: :false
  end
end
