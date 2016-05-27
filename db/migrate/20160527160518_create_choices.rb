class CreateChoices < ActiveRecord::Migration
  def change
    create_table :choices do |t|
      t.references :query, index: true, foreign_key: true
      t.string :content

      t.timestamps null: false
    end
  end
end
