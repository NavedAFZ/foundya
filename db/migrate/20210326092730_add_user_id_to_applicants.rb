class AddUserIdToApplicants < ActiveRecord::Migration[6.1]
  def change
    add_column :applicants, :user_id, :integer
    add_index :applicants, :user_id
  end
end
