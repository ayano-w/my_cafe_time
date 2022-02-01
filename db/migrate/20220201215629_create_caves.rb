class CreateCaves < ActiveRecord::Migration[5.2]
  def change
    create_table :caves do |t|
      t.integer "user_id"
      t.integer "category_id", null: false
      t.string "tea", null: false
      t.string "teacake", null: false
      t.string "tea_image_id"
      t.string "comment"
      t.timestamps
    end
  end
end
