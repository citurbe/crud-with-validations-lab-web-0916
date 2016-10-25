class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: true
  validates :artist_name, presence: true
  # validates :released, inclusion: {in: %w(true, false)}
  validate :released_year_check
  validate :not_the_future

  def released_year_check
    errors.add(:release_year, "release year missing") if !release_year.present? && released == true
  end

  def not_the_future
    errors.add(:release_year, "release year cannot be in the future") if release_year.to_i > 2016
  end



end
