class Group < ApplicationRecord
  belongs_to :merchant
  has_many :messages, dependent: :destroy
end
