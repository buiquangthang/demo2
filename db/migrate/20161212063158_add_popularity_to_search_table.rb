class AddPopularityToSearchTable < ActiveRecord::Migration[5.0]
  def change
    add_column :searches, :popularity, :integer
  end
end
