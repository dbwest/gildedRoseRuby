require './gilded_rose.rb'
require "rspec"

describe GildedRose do

  it "should raise the quality of aged brie" do
    previous_quality = subject.items[1].quality
    subject.update_quality
    current_quality = subject.items[1].quality
    (previous_quality + 1).should == current_quality
  end

  it "should raise the quality of Backstage passes initially" do
    previous_quality = subject.items[4].quality
    subject.update_quality
    current_quality = subject.items[4].quality
    (previous_quality + 1).should == current_quality
  end

  it "should make a normal item, i.e. elixir of the mongoose, degrade twice as fast after sellby date passed" do
    5.times {subject.update_quality}
    previous_quality = subject.items[2].quality
    subject.update_quality
    current_quality = subject.items[2].quality
    (previous_quality - 2).should == current_quality
  end

  it "should make the tickets worthless after their sellby date has passed" do
      16.times {subject.update_quality}
      0.should == subject.items[4].quality
  end

  it "should not allow negative item qualities" do
    12.times {subject.update_quality}
    subject.items[2].quality.should be > -1
  end

  it "should not let sulfuras degrade in quality" do
      old_quality = subject.items[3].quality
      2.times {subject.update_quality}
      new_quality = subject.items[3].quality
      new_quality.should equal old_quality
  end

  it "should not let any regular item have a value more than 50" do
      52.times {subject.update_quality}
      subject.items[1].quality.should be <= 50
  end

  it "should make the sellby date for Dexterity Vest change" do
      sellby_old = subject.items[0].sell_in
      subject.update_quality
      sellby_new = subject.items[0].sell_in
      sellby_new.should equal (sellby_old - 1)
  end

  it "should make the sellby date for the elixir change" do
      sellby_old = subject.items[2].sell_in
      subject.update_quality
      sellby_new = subject.items[2].sell_in
      sellby_new.should equal (sellby_old - 1)
  end

  it "should make the sellby date for the backstage passes change" do
      sellby_old = subject.items[4].sell_in
      subject.update_quality
      sellby_new = subject.items[4].sell_in
      sellby_new.should equal (sellby_old - 1)
  end
end
