require 'action_view'
#require 'date'

class Cat < ApplicationRecord
  
  include ActionView::Helpers::DateHelper

  COLORS = %w(White Black Gray Brown Orange)

  validates :birth_date, :color, :name, :sex, :description, presence: true
  validates :sex, inclusion: { in: %w(M F), message: "Not a valid sex"}
  validates :color, inclusion: { in: COLORS, message: "Not a valid color"}

  def age
    time_ago_in_words(birth_date)
  end

  def self.colors
    COLORS
  end

end