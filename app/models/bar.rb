class Bar < ApplicationRecord
    has_many :reviews, dependent: :destroy
end
