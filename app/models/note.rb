class Note < ApplicationRecord
  belongs_to :user
  belongs_to :client
  validates :date, presence: true
  validates :length_in_minutes, presence: true, numericality: { only_integer: true }
  validates :content, length: { minimum: 75 }
end
