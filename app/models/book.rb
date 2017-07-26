class Book < ApplicationRecord
    validates :title, presence: true,
                      length: { minimum: 5 }
    validates :author, presence: true,
                       length: { minimum: 5 }
    validates :rating, inclusion: 0..10

    has_many :notes
end
