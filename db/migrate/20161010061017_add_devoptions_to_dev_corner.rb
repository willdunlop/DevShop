class AddDevoptionsToDevCorner < ActiveRecord::Migration[5.0]
  def change
    add_column :dev_corners, :user_css_input, :text
    add_column :dev_corners, :user_html_input, :text

  end
end
