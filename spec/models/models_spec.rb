require 'spec_helper'

describe 'Donor' do
  it 'does not save a donor without email' do
    d1 = Donor.create(:name=>"test", :password=>"test")
    expect(d1.valid?).to be false
  end

  it 'does saves a donor with email' do
    d1 = Donor.create(:name=>"test", :email=>"a@b.com",:password=>"test")
    expect(d1.valid?).to be true
  end
end

describe 'Charity' do
  it 'does not save a charity without name' do
    c1 = Charity.create(:name=>"")
    expect(c1.valid?).to be false
  end
end

describe 'Associations' do
  before do
    @d1 = Donor.create(:name=>"test", :email=>"test", :password=>"test")
    @c1 = Charity.create(:name=>"redcross")
    @don = Donation.create(:donor=>@d1, :charity=>@c1)
  end

  it 'makes donor associate with charity' do
    # binding.pry
    expect(@d1.charities).to include(@c1)
  end

  it 'makes charity associate with donor' do
    expect(@c1.donors).to include(@d1)
  end
end
