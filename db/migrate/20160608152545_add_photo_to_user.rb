class AddPhotoToUser < ActiveRecord::Migration
  def change
    add_column :users, :photo, :string, default: "image/upload/v1465401085/d4kintumlce5kzphvnba.png"
  end
end
