class Recipe < ApplicationRecord
  has_many :tags, dependent: :destroy
end
