class DevCorner < ApplicationRecord
  belongs_to :profile
  acts_as_votable
  def score
    self.find_votes_for.sum(:vote_weight).to_f / self.votes_for.size.to_f
  end
end
