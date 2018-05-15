class Language < ApplicationRecord
  has_many :descriptions
  has_many :products , through: :descriptions
end
