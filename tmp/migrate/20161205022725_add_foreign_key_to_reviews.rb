class AddForeignKeyToReviews < ActiveRecord::Migration[5.0]
  def change
    #add_foreign_key :reviews, :books
    add_foreign_key :reviews, :books, on_update: :cascade, on_delete: :nullify
  end
end
