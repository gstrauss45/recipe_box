class AddRecipesToTags < ActiveRecord::Migration[6.1]
  def change
    add_reference :recipes, :tag, foreign_key: true, null: true
  end
end
