class Event < ApplicationRecord
    validates :title, :description, :date_time, presence: true
    belongs_to :creator, class_name: 'User'

    has_many :invitations
    has_many :attendees, through: :invitations, source: :user

    scope :past, -> {where 'date_time < ?', Date.today}
    scope :upcoming, -> {where 'date_time >= ?', Date.today}
end
