class AddCanvasColumnsToIdeas < ActiveRecord::Migration
  def change
    remove_column :ideas, :description
    add_column :ideas, :key_partners, :text
    add_column :ideas, :key_activities, :text
    add_column :ideas, :key_resources, :text
    add_column :ideas, :value_propositions, :text
    add_column :ideas, :customer_relationships, :text
    add_column :ideas, :channels, :text
    add_column :ideas, :customer_segments, :text
    add_column :ideas, :cost_structure, :text
    add_column :ideas, :revenue_streams, :text
  end
end
