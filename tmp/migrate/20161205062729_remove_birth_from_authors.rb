class RemoveBirthFromAuthors < ActiveRecord::Migration[5.0]
  def change
    remove_column :authors, :birth, :date
  end
end
