class AddAuthorToBooks < ActiveRecord::Migration[5.0]
  def change
    say 'Add author column to books table.'
    suppress_messages do
      add_column :authors, :birth, :date
    end
  end
end
