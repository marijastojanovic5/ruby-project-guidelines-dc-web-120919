class Book < ActiveRecord::Base
    belongs_to :genre
    has_many :checkouts
    has_many :readers, through: :checkout
end