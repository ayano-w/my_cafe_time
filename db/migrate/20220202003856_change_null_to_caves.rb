class ChangeNullToCaves < ActiveRecord::Migration[5.2]
  def change
    change_column_null :caves, :teacake, true
    change_column_null :caves, :tea_image_id, false
  end
end
