class ChangeTypeId < ActiveRecord::Migration[5.0]
  def change
    rename_column :activities, :type_id, :source
  end
end
