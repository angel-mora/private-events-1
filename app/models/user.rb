class User < ApplicationRecord
    validates :first_name, :last_name, presence: true
    validates :email, :username, presence: true, uniqueness: true
    has_many :events, foreign_key: 'creator_id'
    has_many :invitations
    has_many :attended_events, through: :invitations, source: :event
end
