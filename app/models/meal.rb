class Meal < ApplicationRecord

    validates :name, presence: true,
                     length: { minimum: 2 }
    has_one_attached :image
end
