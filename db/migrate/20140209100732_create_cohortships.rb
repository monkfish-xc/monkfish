class CreateCohortships < ActiveRecord::Migration
  def change
    create_table :cohortships do |t|
      t.integer :user_id
      t.integer :cohort_id

      t.timestamps
    end
    add_index :cohortships, [:user_id, :cohort_id]
  end
end
