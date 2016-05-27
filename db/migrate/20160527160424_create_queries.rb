class CreateQueries < ActiveRecord::Migration
  def change
    create_table :queries do |t|
      t.references :theme, index: true, foreign_key: true
      t.string :content
      t.text :description
      t.string :see_more

      t.timestamps null: false
    end
  end
end
