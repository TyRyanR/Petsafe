class Emergency < ApplicationRecord
  belongs_to :user
  belongs_to :firestation, :class_name => "User", foreign_key: :firestation_id
end
