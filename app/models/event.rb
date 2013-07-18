require 'date'

class Event < ActiveRecord::Base
  # Date validation
  validates :date, presence: true
  validates :date, format: {with: /^(19|20)\d\d[- \/.](0[1-9]|1[012])[- \/.](0[1-9]|[12][0-9]|3[01])$/}
  validate  :date_cannot_be_in_the_past
  
  # Event title validation
  validates :title, presence: true

  #Event organizer name validation
  validates :organizer_name, presence: true

  #Organizer email address validation
  validates :organizer_email, presence: true
  validates :organizer_email, format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}

  before_save {self.organizer_email = self.organizer_email.downcase}

  def date_cannot_be_in_the_past
    if date.present? && date < Date.today
      errors.add(:expiration_date, "can't be in the past")
    end
  end
end
