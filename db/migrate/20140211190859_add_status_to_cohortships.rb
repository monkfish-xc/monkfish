class AddStatusToCohortships < ActiveRecord::Migration
  def change
    add_column :cohortships, :status, :string
  end
end
