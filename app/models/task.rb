class Task < ApplicationRecord
  validates :description, presence: true
  validates :status, presence: true

  scope :uncompleted, -> { where(status: 'uncompleted') }
  scope :completed, -> { where(status: 'completed') }
end
