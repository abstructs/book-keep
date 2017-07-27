class Note < ApplicationRecord
  belongs_to :book
  belongs_to :user

  validates :body, presence: true
  validates :user, presence: true
  validates :book, presence: true

end
