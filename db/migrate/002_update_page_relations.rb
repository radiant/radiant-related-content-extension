class UpdatePageRelations < ActiveRecord::Migration
  def self.up
    add_column :page_relations, :position, :integer 
  end

  def self.down
    remove_column :page_relations, :position
  end
end
