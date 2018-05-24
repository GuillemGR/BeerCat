class Command < ApplicationRecord
  has_many :line_commands
  belongs_to :user
end
