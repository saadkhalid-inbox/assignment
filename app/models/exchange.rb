class Exchange < ApplicationRecord
  validates :title, uniqueness: true
end
