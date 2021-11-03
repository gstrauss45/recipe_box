class AddTagsToRecipes < ActiveRecord::Migration[6.1]
  def change
    add_reference :tags, :recipe, foreign_key: true, null: true
  end
end
