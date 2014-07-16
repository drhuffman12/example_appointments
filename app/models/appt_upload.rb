class ApptUpload < ActiveRecord::Base
  validates :content, presence: true #, format: { with: $RE_SIMPLE_CSV_CONTENT } 
  validate :content_in_correct_format
  
private  
  def content_in_correct_format
    msg = "Required format for rows: datetime,datetime,name,name,comment; where comment is optional, datetime is mm/dd/yyyy hh:mm, and name and comment only contain 'word' characters such as A-Z, a-z, 0-9, and '_'. (Header row is considered line # 0.)"
    
    has_error = false
    
    if (content)
      # errors.add(:content, "Required format for rows: datetime,datetime,name,name,comment; where comment is optional, datetime is mm/dd/yyyy hh:mm, and name and comment only contain 'word' characters such as A-Z, a-z, 0-9, and '_'.") unless ($RE_SIMPLE_CSV_LINE.match(content))
      content.gsub!("\r\n","\n")
      lines = content.split("\n")
      
      len = lines.length
      unless (len >= 2)
        has_error = true
        msg += " [ERROR: Missing data. First line should be header, followed by data lines. # of lines: #{len}]"
      else
        (1..(len-1)).each do |ln|
          line = lines[ln]
              
          line_parts = line.split(',')
          Rails.logger.info " # #{ln}: line_parts == #{line_parts}"
          
          line_parts_len = line_parts.length
          Rails.logger.info " # #{ln}: line_parts_len == #{line_parts_len}"
          
          unless (line_parts_len == 4 || line_parts_len == 5)
            has_error = true
            msg += " [ERROR: Wrong number of columns: #{line_parts_len} in line #: #{ln}.]"
          else
            comments = nil
            start_time, end_time, first_name, last_name = line_parts[0..4] if (line_parts_len = 4)
            start_time, end_time, first_name, last_name, comments = line_parts[0..4] if (line_parts_len = 5)
              
            Rails.logger.info " # #{ln}: line_parts : #{[start_time, end_time, first_name, last_name, comments]}"
            
              
            Rails.logger.info " # #{ln}: from, to : #{[DateTime.parse(start_time), DateTime.parse(end_time)]}"
            
            begin
              s = ApptSched.new
              # s.start_time = start_time
              s.start_time = DateTime.parse(start_time)

              # s.end_time = end_time
              s.end_time = DateTime.parse(end_time)
              
              s.first_name = first_name
              s.last_name = last_name
              s.comments = comments
              s.save!
            rescue Exception => e
              has_error = true
              msg += " [ERROR: ApptSched data error: #{e.message} in line #: #{ln}.]"
            end
            
          end
          
        end
        
      end
      
      
      Rails.logger.info "has_error == #{has_error}"
      
      errors.add(:content, msg) if has_error
      
    end    
  end
end

=begin

    $RE_SIMPLE_DATETIME = /\A[0-9\/]+\s[0-9:]+\z/
    $RE_SIMPLE_NAME = /\A(\w+)(\s+\w+)*\z/
    $RE_SIMPLE_COMMENT = /(\A(\w+)(\s+\w+)*\z)*/
    $RE_SIMPLE_CSV_LINE = /\A([0-9\/]+\s[0-9:]+),([0-9\/]+\s[0-9:]+),((\w+)(\s+\w+)*),((\w+)(\s+\w+)*),((\w+)(\s+\w+)*)?\z/
    $RE_SIMPLE_CSV_HEADER = /\A((\w+)(\s+\w+)*),((\w+)(\s+\w+)*),((\w+)(\s+\w+)*),((\w+)(\s+\w+)*),((\w+)(\s+\w+)*)?\z/
    $RE_SIMPLE_CSV_CONTENT = /(\A((\w+)(\s+\w+)*),((\w+)(\s+\w+)*),((\w+)(\s+\w+)*),((\w+)(\s+\w+)*),((\w+)(\s+\w+)*)?\z)?(\A([0-9\/]+\s[0-9:]+),([0-9\/]+\s[0-9:]+),((\w+)(\s+\w+)*),((\w+)(\s+\w+)*),((\w+)(\s+\w+)*)?\z)+/
    
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :first_name, presence: true, format: { with: $RE_SIMPLE_NAME } # TODO: not a stated requirement, but probably should be.
  validates :last_name, presence: true, format: { with: $RE_SIMPLE_NAME } # TODO: not a stated requirement, but probably should be.
  validates :comments, format: { with: $RE_SIMPLE_COMMENT } # TODO: not a stated requirement, but probably should be.
  
=end
