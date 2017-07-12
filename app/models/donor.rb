class Donor < ActiveRecord::Base

  has_secure_password

  has_many :donations
  has_many :charities, :through=>:donations

  validates :name, presence: true
  validates :email, presence: true

  def total_donation
    self.donations.sum(:item_price)
  end

  def donated_to_charity(charity)
    self.donations.where(:charity_id=>charity.id).sum(:item_price)
  end

end
