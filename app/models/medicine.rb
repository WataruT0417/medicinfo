class Medicine < ApplicationRecord
  validates :name, presence: true, length: {maximum: 100}
  validates :title, presence: true
  validates :code, length: {maximum: 20}
end
