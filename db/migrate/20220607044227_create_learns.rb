class CreateLearns < ActiveRecord::Migration[6.0]
  def change
    create_table :learns do |t|
      t.string :title,       null: false
      t.text :description
      t.integer :subject_id, null: false
      t.string :study_hour
      t.string :study_minutes
      t.references :user,    foreign_key: true
      t.timestamps
    end
  end
end
