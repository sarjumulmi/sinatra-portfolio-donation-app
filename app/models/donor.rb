class Donor < ActiveRecord::Base

  has_secure_password

  has_many :donations
  has_many :charities, :through=>:donations

  validates :name, presence: true
  validates :email, presence: true

end
