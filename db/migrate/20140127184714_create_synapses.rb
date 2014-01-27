class CreateSynapses < ActiveRecord::Migration
  def self.up
    create_table :synapses do |t|
      t.integer :user_id
      t.integer :other_user_id
      t.timestamps
    end
  end

  def self.down
    drop_table :synapses
  end
end
