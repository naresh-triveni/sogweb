class EmailSubscription < ActiveRecord::Base
  validates :email, uniqueness: {message: 'You have already subscribed'}, on: :create
  validates :email, presence: true
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: 'Invalid email'
end
