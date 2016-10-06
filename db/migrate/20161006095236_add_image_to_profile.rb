class AddImageToProfile < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :image, :string
  end
end
