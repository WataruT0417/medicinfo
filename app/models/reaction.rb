class Reaction < ApplicationRecord
  validates :name, presence: true, length: {maximum: 100}
  validates :title, presence: true
  validates :doctor, length: {maximum: 100}
  validates :patient_id, length: {maximum: 10}
  validates :patient_name, length: {maximum: 100}
  validates :report_staff, length: {maximum: 100}
end
