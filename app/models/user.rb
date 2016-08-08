class User < ApplicationRecord
  before_create :set_type

  has_many :firestations, :class_name => "User"
  has_many :emergencies, foreign_key: "firestation_id"



  validates :username, presence: true, length: { maximum: 15, message: "Username cannot be more than 15 characters" }, uniqueness: true
  validates :password, presence: true, length: { maximum: 15, message: "Password cannot be more than 15 characters" }
  validates :name, presence: true, length: { maximum: 30, message: "Name field cannot contain more than 30 characters" }

  def get_emergencies
    if self.firestation
      Emergency.where(firestation_id: self.id)
    else
      Emergency.find_by(user_id: self.id)
    end
  end

  def set_type #this function sets the user column firestation depending on whether user signs up as pet owner or firestation
    if self.address == nil
      self.firestation = true
    else
      self.firestation = false
    end
  end

end
