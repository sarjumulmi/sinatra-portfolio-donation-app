class Donation < ActiveRecord::Base

  belongs_to :donor
  belongs_to :charity
end
