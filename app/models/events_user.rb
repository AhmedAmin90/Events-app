class EventsUser < ApplicationRecord
  # one user can attend the event one time.
  validates :user_id, uniqueness: { scope: :event_id }

  belongs_to :user
  belongs_to :event
end
