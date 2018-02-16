class Merchant < ApplicationRecord
  has_many :authtokens, dependent: :destroy
end
