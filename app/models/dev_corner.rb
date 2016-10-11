class DevCorner < ApplicationRecord
  belongs_to :profile
  acts_as_votable
  def score
    self.find_votes_for.sum(:vote_weight).to_f / self.votes_for.size.to_f
  end

  def self.highest_voted
    self.order("cached_votes_score DESC")
  end

  def self.search(search)
    where("first_name LIKE ?", "%#{search}%")

  end

end
