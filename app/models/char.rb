class Char < ApplicationRecord
  validates :name, presence: true, uniqueness: { scope: :nick, message: 'There is such char in you base' }
end
