class Product < ApplicationRecord
  has_many :descriptions
  has_many :languages , through: :descriptions
end
