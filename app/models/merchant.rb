class Merchant < ApplicationRecord
  has_many :authtokens, dependent: :destroy

  has_many :employees
end
