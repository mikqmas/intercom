class Merchant < ApplicationRecord
  has_many :authtokens, dependent: :destroy
  has_many :groups, dependent: :destroy
  has_many :messages, dependent: :destroy
end
