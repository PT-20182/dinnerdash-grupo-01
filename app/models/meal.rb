class Meal < ApplicationRecord

    validates :name, presence: true,
                     length: { minimum: 2 }
    has_one_attached :image
    validates_uniqueness_of :name, message: 'Refeição já existe  '

    validates :description, presence: true,
                            length: {minimum:2}

    has_one :categories
    validates :price, numericality: { greater_than: 0}
    belongs_to :category
end