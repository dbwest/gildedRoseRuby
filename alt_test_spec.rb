require './gilded_rose.rb'


describe GildedRose do

  it "should do something" do
    subject.update_quality
  end


  # vest / standard items

  it "should degrade vest by 1 quality" do
    subject.update_quality
    subject.items[0].quality.should == 19
  end

   it "vest never be less than 0 quality" do
   	16.times do
    	subject.update_quality
  	end
    subject.items[0].quality.should == 0
  end

  it "should change sell by -1 for vest" do
    subject.update_quality
    subject.items[0].sell_in.should == 9
  end

  it "should change quality to 8 after 11 days for vest" do
    11.times do
    	subject.update_quality
  	end
    subject.items[0].quality.should == 8
  end


  # the brie

  it "should change aged brie quality +1" do
  	subject.update_quality
  	subject.items[1].quality.should == 1
  end

  it "should change brie sell in by -1" do
  	subject.update_quality
  	subject.items[1].sell_in.should == 1
  end

  it "brie quality should never be more than 50" do
  	51.times do
  		subject.update_quality
  	end
  	subject.items[1].quality.should == 50
  end


  # sulfuras

	it "should change sulfuras quality 0" do
  	subject.update_quality
  	subject.items[3].quality.should == 80
  end

  it "should change sulfuras sell in by 0" do
  	subject.update_quality
  	subject.items[3].sell_in.should == 0
  end


  #backstage passes

	it "tickets quality +1 if sell_in > 10 days" do
  	subject.update_quality
  	subject.items[4].quality.should == 21
  end

	it "tickets quality +2 if sell_in 6-10 days" do
  	# 15 => 20
  	# 14 => 21
  	# 13 => 22
  	# 12 => 23
  	# 11 => 24
  	# 10 => 25
  	# 9 => 27
  	6.times do
  		subject.update_quality
  	end
  	subject.items[4].quality.should == 27
  end

  	# 15 => 20
  	# 14 => 21
  	# 13 => 22
  	# 12 => 23
  	# 11 => 24
  	# 10 => 25
  	# 9 => 27
  	# 8 => 29
  	# 7 => 31
  	# 6 => 33
  	# 5 => 35
  	# 4 => 38

	it "should change tickets quality +3 if sell_in 1-5 days" do
  	11.times do
  		subject.update_quality
  	end
  	subject.items[4].quality.should == 38
  end

  it "when tickets sell in == 0, quality should equal 0" do
  	16.times do
  		subject.update_quality
  	end
  	subject.items[4].quality.should == 0
  end

  it "tickets should never be > 50" do
  	15.times do
  	 	subject.update_quality
  	end
  	subject.items[4].quality.should_not >= 51
  end

  it "should change sell_in by -1 for tickets" do
    subject.update_quality
    subject.items[4].sell_in.should == 14
  end

end
