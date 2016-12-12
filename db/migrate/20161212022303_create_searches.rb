class CreateSearches < ActiveRecord::Migration[5.0]
  def change
    create_table :searches do |t|
      t.string :keywords
      t.integer :category
      t.boolean :learn

      t.timestamps
    end
  end
end
