class CreateActivities < ActiveRecord::Migration[5.0]
  def change
    create_table :activities do |t|
      t.string :content
      t.references :user, foreign_key: true
      t.integer :type
      t.integer :type_id

      t.timestamps
    end
  end
end
