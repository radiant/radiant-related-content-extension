class CreatePageRelations < ActiveRecord::Migration
  def self.up
    create_table :page_relations do |t|
      t.column :from_id, :integer
      t.column :to_id, :integer
      t.column :created_at, :datetime
      t.column :updated_at, :datetime
    end
    add_index :page_relations, :from_id
  end

  def self.down
    drop_table :page_relations
  end
end
