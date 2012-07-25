require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "RuoteRegistry" do
  it "remembers" do
    pdef = Ruote.define(:name => "remembered") do
      alpha
      bravo
      charlie
    end
    
    Ruote.definition(:remembered).should eq pdef
  end
end
