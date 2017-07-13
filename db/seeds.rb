3.times do |n|
  Donor.create(:name=>"donor#{n}", :email=>"a#{n}@test.com", :password=>"test#{n}" )
  Charity.create(:name=>"charity#{n}")
end

donation1 = Donation.create(:item=>"item1", :item_price=>100, :donor=>Donor.find(1), :charity=>Charity.find(1))
donation2 = Donation.create(:item=>"item2", :item_price=>1000, :donor=>Donor.find(1), :charity=>Charity.find(2))
donation3 = Donation.create(:item=>"item3", :item_price=>1500, :donor=>Donor.find(2), :charity=>Charity.find(3))
donation4 = Donation.create(:item=>"item4", :item_price=>2100, :donor=>Donor.find(3), :charity=>Charity.find(3))
donation5 = Donation.create(:item=>"item5", :item_price=>1200, :donor=>Donor.find(2), :charity=>Charity.find(1))
donation6 = Donation.create(:item=>"item6", :item_price=>300, :donor=>Donor.find(3), :charity=>Charity.find(2))
