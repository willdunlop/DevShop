class CreateDevCorners < ActiveRecord::Migration[5.0]
  def change
    create_table :dev_corners do |t|
      t.references :profile, foreign_key: true
      t.text :skills
      t.text :experience
      t.text :strengths

      t.timestamps
    end
  end
end
