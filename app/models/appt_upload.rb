class ApptUpload < ActiveRecord::Base
  validates :content, presence: true #, format: { with: $RE_SIMPLE_CSV_CONTENT } 
  validate :content_in_correct_format
  
private  
  def content_in_correct_format
    if (content)
      errors.add(:content, "Required format for rows: datetime,datetime,name,name,comment; where comment is optional, datetime is mm/dd/yyyy hh:mm, and name and comment only contain 'word' characters such as A-Z, a-z, 0-9, and '_'.") unless ($RE_SIMPLE_CSV_CONTENT.match(content))
    end    
  end
end
