class ApptSched < ActiveRecord::Base
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :first_name, presence: true, format: { with: $RE_SIMPLE_NAME } # TODO: not a stated requirement, but probably should be.
  validates :last_name, presence: true, format: { with: $RE_SIMPLE_NAME } # TODO: not a stated requirement, but probably should be.
  validates :comments, format: { with: $RE_SIMPLE_COMMENT } # TODO: not a stated requirement, but probably should be.
  
  validate :start_before_end
  validate :start_after_now
  validate :end_after_now
  validate :start_does_not_overlap
  validate :end_does_not_overlap

private  
  def start_before_end
    if (start_time && end_time)
      errors.add(:end_time, "start_time should be before end_time") if (start_time > end_time)
    end    
  end
  
  def start_after_now
    if (start_time)
      # errors.add(:start_time, "start_time should be in future") if (start_time < Time.now)
      errors.add(:start_time, "start_time should be in future") if (start_time < Time.now)
    end    
  end
  
  def end_after_now
    if (end_time)
      # errors.add(:start_time, "start_time should be in future") if (start_time < Time.now)
      errors.add(:end_time, "end_time should be in future") if (end_time < Time.now)
    end    
  end
  
  def start_does_not_overlap
    if (start_time)
      errors.add(:start_time, "start_time should not overlap existing records") if (ApptSched.exists?(["(start_time <= ?) AND (? <= end_time)", start_time, start_time]))
    end    
  end
  
  def end_does_not_overlap
    if (end_time)
      errors.add(:end_time, "end_time should not overlap existing records") if (ApptSched.exists?(["(start_time <= ?) AND (? <= end_time)", end_time, end_time]))
    end    
  end

end
