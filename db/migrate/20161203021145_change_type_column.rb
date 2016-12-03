class ChangeTypeColumn < ActiveRecord::Migration[5.0]
  def change
    rename_column :activities, :type, :action
  end
end
