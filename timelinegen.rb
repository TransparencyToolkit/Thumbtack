require 'json'

class TimelineGen

  # Get start date
  def self.startDate(date)
    date
  end
  
  #Get end date
  def self.endDate(date)
    date
  end

  #Get headline
  def self.getHeadline(headline)
    headline
  end

  def self.addText(text)
    text
  end
  
  #Generate JSON for event
  def self.genEvent
    JSON.pretty_generate(
                         "date" => [
                                    "startDate" => startDate("10,10,10"),
                                    "endDate" => endDate(nil),
                                    "headline" => getHeadline("test headline"),
                                    "text" => addText("This is the text body of the email"),
                                   ]
                        )
  end

  #Generate JSON for timeline
  def self.genTimeline
    puts genEvent
    puts genEvent
  end

  puts genTimeline
end
