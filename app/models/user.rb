class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :events, foreign_key: 'creator_id'
  has_many :event_attendings, foreign_key: :attendee_id
  has_many :attended_events, through: :event_attendings
  has_many :invitations, foreign_key: 'invitee_id'

  validates :name, presence: true, uniqueness: true, length: { in: 4..10 }
end
