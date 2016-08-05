class User < ApplicationRecord
  after_create :set_type

  has_many :pets
  has_many :emergencies
  has_many :firestations, :through => :emergencies

  def set_type #this function sets the user column firestation depending on whether user signs up as pet owner or firestation
    if self.address == nil
      self.firestation = true
    else
      self.firestation = false
    end
  end

end
