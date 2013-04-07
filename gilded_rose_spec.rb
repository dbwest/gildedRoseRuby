require './gilded_rose.rb'
require "rspec"

describe GildedRose do

  it "should raise the quality of aged brie" do
    rose = GildedRose.new
    previous_quality = subject.items[1].quality
    subject.update_quality
    current_quality = subject.items[1].quality
    current_quality.should == (previous_quality + 1)
  end


end
