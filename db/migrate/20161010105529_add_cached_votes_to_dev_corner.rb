class AddCachedVotesToDevCorner < ActiveRecord::Migration[5.0]
  def self.up
    add_column :dev_corners, :cached_votes_total, :integer, :default => 0
    add_column :dev_corners, :cached_votes_score, :integer, :default => 0
    add_column :dev_corners, :cached_votes_up, :integer, :default => 0
    add_column :dev_corners, :cached_votes_down, :integer, :default => 0
    add_index  :dev_corners, :cached_votes_total
    add_index  :dev_corners, :cached_votes_score
    add_index  :dev_corners, :cached_votes_up
    add_index  :dev_corners, :cached_votes_down
  end

  def self.down
    remove_column :dev_corners, :cached_votes_total
    remove_column :dev_corners, :cached_votes_score
    remove_column :dev_corners, :cached_votes_up
    remove_column :dev_corners, :cached_votes_down
  end
end
