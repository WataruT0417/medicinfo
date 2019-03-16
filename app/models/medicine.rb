class Medicine < ApplicationRecord
  validates :name, presence: true, length: {maximum: 100}
  validates :title, presence: true
  validates :request_staff, length: {maximum: 20}
  validates :report_staff, length: {maximum: 20}
end
