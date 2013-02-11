require 'netstat24'

describe Netstat24 do

  before(:all) do
    @netstat24 = Netstat24.new('1064', '9aaf83741f7b11aeefbe224464ef9dd212a9a897', 3465564)
  end

  it "should return app_id" do
    @netstat24.app_id.should == '1064'
  end

  it "should return ok on visit by some user" do
    @netstat24.visit().should == {"ok"=>"ok"}
  end

  it "should return ok on userDat" do
    @netstat24.userData(23, 'f', 154, 37, 75).should == {"ok"=>"ok"}
  end

end