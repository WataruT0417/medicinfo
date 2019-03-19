class Doubt < ApplicationRecord
  validates :name, presence: true, length: {maximum: 100}
  validates :title, presence: true
  validates :doctor, length: {maximum: 100}
  validates :report_staff, length: {maximum: 100}
end
