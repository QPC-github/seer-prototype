class Project < ApplicationRecord
  has_many :estimates

  validates :name, presence: true

  def min_of_min_magnitudes
    self.estimates.minimum(:min_magnitude)
  end

  def average_of_likely_magnitudes
    estimate_average = self.estimates.average(:likely_magnitude)
    if estimate_average
      estimate_average.round(2)
    else
      nil
    end
  end

  def max_of_max_magnitudes
    self.estimates.maximum(:max_magnitude)
  end

  def min_of_min_frequencies
    self.estimates.minimum(:min_frequency)
  end

  def average_of_likely_frequencies
    estimate_average = self.estimates.average(:likely_frequency)
    if estimate_average
      estimate_average.round(2)
    else
      nil
    end
  end

  def max_of_max_frequencies
    self.estimates.maximum(:max_frequency)
  end
end
