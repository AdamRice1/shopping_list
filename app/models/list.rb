class List < ApplicationRecord
  belongs_to :account_owner
  belongs_to :user
  validates :item, presence: true, length: { in: 2..100 }
  validates :quantity, numericality: { only_interger: true } 
end
