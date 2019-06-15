class Inquiry < ApplicationRecord
  belongs_to :artwork
  
  validates :name, :email, :message, presence: true
end
