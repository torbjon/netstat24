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

  it "should run trackEvent" do
    @netstat24.trackEvent('SomeEvent').should == {"ok"=>"ok"}
  end

  it "should run trackValue" do
    @netstat24.trackValue('SomeEvent', 'SomeValue').should == {"ok"=>"ok"}
  end

  it "should run trackNumber" do
    @netstat24.trackNumber('SomeEvent', 100).should == {"ok"=>"ok"}
  end

  it "should run revenue" do
    @netstat24.revenue(100).should == {"ok"=>"ok"}
  end

  it "should run visit" do
    @netstat24.visit().should == {"ok"=>"ok"}
  end

  it "should run install" do
    @netstat24.install('ad').should == {"ok"=>"ok"}
  end

  it "should run install without value" do
    @netstat24.install().should == {"ok"=>"ok"}
  end

  it "should run userData" do
    @netstat24.userData(23, 'f', 154, 37, 75).should == {"ok"=>"ok"}
  end

  it "should run userData" do
    @netstat24.userData(nil, nil, nil, nil, nil).should == {"ok"=>"ok"}
  end

  it "should run adClick" do
    @netstat24.adClick('ad134').should == {"ok"=>"ok"}
  end

  it "should run inviteSent" do
    @netstat24.inviteSent().should == {"ok"=>"ok"}
  end

  it "should run inviteResponse" do
    @netstat24.inviteResponse().should == {"ok"=>"ok"}
  end

end
