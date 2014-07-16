require 'test_helper'

class ApptSchedTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
    
  # in future:
  test "should not save when start_time is in the past" do
    as1 = ApptSched.new
    as1.start_time = Time.now - 1 # as1.start_time > Time.now
    as1.end_time = as1.start_time + 0.1 +1
    as1.first_name = 'first_name'
    as1.last_name = 'last_name'
    assert_not as1.save
  end
    
  test "should not save when end_time is in the past" do
    as1 = ApptSched.new
    as1.start_time = Time.now - 1 # as1.start_time > Time.now
    as1.end_time = as1.start_time + 0.1
    as1.first_name = 'first_name'
    as1.last_name = 'last_name'
    assert_not as1.save
  end
    
  # sequence:
  test "should not save when end_time is before start_time" do
    as1 = ApptSched.new
    as1.start_time = Time.now + 2 # as1.start_time > Time.now
    as1.end_time = as1.start_time - 0.1
    as1.first_name = 'first_name'
    as1.last_name = 'last_name'
    assert_not as1.save
  end
    
  # required fields:
  test "should not save without start_time" do
    as1 = ApptSched.new
    # as1.start_time = Time.now + 2 # as1.start_time > Time.now
    as1.end_time = Time.now + 1
    as1.first_name = 'first_name'
    as1.last_name = 'last_name'
    assert_not as1.save
  end
    
  test "should not save without end_time" do
    as1 = ApptSched.new
    as1.start_time = Time.now + 2 # as1.start_time > Time.now
    # as1.end_time = Time.now + 1
    as1.first_name = 'first_name'
    as1.last_name = 'last_name'
    assert_not as1.save
  end
  
  test "should not save if start_time overlaps" do
    @appt_sched = appt_scheds(:two)
    
    as1 = ApptSched.new
    # taver = t1 + ((t2 - t1) / 2)
    as1.start_time = @appt_sched.start_time + ((@appt_sched.end_time - @appt_sched.start_time) / 2)
    as1.end_time = @appt_sched.end_time + 1
    as1.first_name = 'first_name'
    as1.last_name = 'last_name'
    assert_not as1.save
  end
  
  test "should not save if end_time overlaps" do
    @appt_sched = appt_scheds(:one)
    
    as1 = ApptSched.new
    # taver = t1 + ((t2 - t1) / 2)
    as1.end_time = @appt_sched.start_time + ((@appt_sched.end_time - @appt_sched.start_time) / 2)
    as1.start_time = @appt_sched.start_time - 1
    as1.first_name = 'first_name'
    as1.last_name = 'last_name'
    assert_not as1.save
  end
  
=begin
  end

  test "should not save if start_time overlaps" do
    as1 = ApptSched.new
    as1.start_time = Time.now + 0.1 # as1.start_time > Time.now
    as1.end_time = Time.now + 0.5
    as1.first_name = 'first_name'
    as1.last_name = 'last_name'
    as1.save
    
    as2 = ApptSched.new
    as2.start_time = Time.now + 0.4 # as2.start_time > Time.now
    as2.end_time = Time.now + 0.6
    as2.first_name = 'first_name'
    as2.last_name = 'last_name'
    
    assert_not as2.save
  end
=end  
end
