require 'rails_helper'

RSpec.describe Client, :type => :model do
  before do
  @client = Client.new(
					        full_name:           'Johny Dep',
					        business_name:  'John',
					        tel_num:     '07785653214',
					        email:          'john@test.com'
					    )
  end
  it "is valid with valid full_name, business_name, tel_num and  email" do
    expect(@client).to be_valid
  end

  it "is not valid without a full_name" do
  	client = Client.new(full_name: nil)
  	expect(client).to_not be_valid
  end

  it "is not valid without a business_name" do
  	client = Client.new(business_name: nil)
  	expect(client).to_not be_valid
  end

  it "is not valid without a tel_num" do
  	client = Client.new(tel_num: nil)
  	expect(client).to_not be_valid
  end

  it "is not valid without a email" do
  	client = Client.new(email: nil)
  	expect(client).to_not be_valid
  end

  it "is not valid with a full name of above 100 characters" do
  	client = Client.new(full_name: "f" * 101)
  	expect(client).to_not be_valid
  end

  it "is not valid with a business name of above 100 characters" do
  	client = Client.new(business_name: "f" * 101)
  	expect(client).to_not be_valid
  end

  it "is not valid with a business name of above 100 characters" do
  	client = Client.new(business_name: "f" * 101)
  	expect(client).to_not be_valid
  end

  it "is not valid when email format is invalid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
        @client.email = invalid_address
        expect(@client).not_to be_valid
  		end 
  end		

  it "is valid when email format is valid" do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        @client.email = valid_address
        expect(@client).to be_valid
      end
    end

   it "is not valid when tel_num more than 13 characters " do
   		client = Client.new(tel_num: "1" * 14)
   		expect(client).to_not be_valid
   end	    

end