class CreateApplicants < ActiveRecord::Migration[6.1]
  def change
    create_table :applicants do |t|
      t.string :name
      t.string :email
      t.string :github_url
      t.string :linked_in
      t.string :cv_url
      t.string :description
      t.string :skill1
      t.string :skill2
      t.string :skill3
      t.string :project1
      t.string :project1_url
      t.string :project2
      t.string :project2_url
      t.string :project3
      t.string :project3_url
      t.string :experience1
      t.string :experience2
      t.string :experience3

      t.timestamps
    end
  end
end
