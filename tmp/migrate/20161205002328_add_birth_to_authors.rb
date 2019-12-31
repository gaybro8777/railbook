class AddBirthToAuthors < ActiveRecord::Migration[5.0]
  def change
    add_column :authors, :birth, :date
  end
end
