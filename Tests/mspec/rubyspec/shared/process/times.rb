describe :process_times, :shared => true do
  it "returns a Struct::Tms" do
    @object.send(@method).class.should == Struct::Tms
  end

  it "returns current cpu times" do

    t = @object.send @method

    # Do busy work for a wall-clock interval.
    start = Time.now
    1 until (Time.now - start) > 0.5

    # Ensure times is larger. NOTE that there is no 
    # guarantee of an upper bound since anything may be 
    # happening at the OS level, so we ONLY check that at 
    # least an interval has elapsed. Also, we are assuming 
    # there is a correlation between wall clock time and 
    # process time. In practice, there is an observed 
    # discrepancy often 10% or greater. In other words, 
    # this is a very fuzzy test.
    t2 = @object.send @method
    diff = (t2.utime + t2.stime) - (t.utime + t.stime)
    diff.should > 0
  end
end
