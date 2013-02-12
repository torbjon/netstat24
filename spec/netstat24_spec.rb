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

  it "should run track_event" do
    @netstat24.track_event('SomeEvent').should == {"ok"=>"ok"}
  end

  it "should run track_value" do
    @netstat24.track_value('SomeEvent', 'SomeValue').should == {"ok"=>"ok"}
  end

  it "should run track_number" do
    @netstat24.track_number('SomeEvent', 100).should == {"ok"=>"ok"}
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

  it "should run user_data" do
    @netstat24.user_data(23, 'f', 154, 37, 75).should == {"ok"=>"ok"}
  end

  it "should run ad_click" do
    @netstat24.ad_click('ad134').should == {"ok"=>"ok"}
  end

  it "should run invite_sent" do
    @netstat24.invite_sent().should == {"ok"=>"ok"}
  end

  it "should run invite_response" do
    @netstat24.invite_response().should == {"ok"=>"ok"}
  end

end
