class User < ApplicationRecord
    has_many :reservations

    validates_presence_of :email, :name
end
