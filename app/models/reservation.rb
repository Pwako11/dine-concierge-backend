class Reservation < ApplicationRecord
    belongs_to :user

    validates_presence_of :booked_time, :notes
end
