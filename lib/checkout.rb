class Checkout  < ActiveRecord::Base
    belongs_to :reader
    belongs_to :book
end