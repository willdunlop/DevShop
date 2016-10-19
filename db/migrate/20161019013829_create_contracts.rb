class CreateContracts < ActiveRecord::Migration[5.0]
  def change
    create_table :contracts do |t|
      t.references :profile, foreign_key: true
      t.references :dev_corner, foreign_key: true
      t.string :name
      t.date :start_date
      t.date :end_date
      t.text :description
      t.boolean :user_agree
      t.boolean :dev_agree
      t.float :cost

      t.timestamps
    end
  end
end
