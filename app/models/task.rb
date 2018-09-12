class Task < ApplicationRecord
  validates :description, presence: true
  validates :status, presence: true
end
