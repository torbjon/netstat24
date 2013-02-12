require 'netstat24'

describe Netstat24 do

  before(:all) do
    app_id = 1064
    secret = '9aaf83741f7b11aeefbe224464ef9dd212a9a897'
    @netstat24 = Netstat24.new(app_id, secret, 3465564)
  end

  it "should return app_id" do
    @netstat24.app_id.should == 1064
  end

  it "should track_event" do
    @netstat24.track_event('SomeEvent').should == {"ok"=>"ok"}
  end

  it "should return ok on visit by some user" do
    @netstat24.visit().should == {"ok"=>"ok"}
  end

  it "should return ok on userDat" do
    @netstat24.userData(23, 'f', 154, 37, 75).should == {"ok"=>"ok"}
  end

  

end