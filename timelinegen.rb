require 'json'

class TimelineGen

  # Change date format to work with TimelineJS
  def self.parseDate(date)
    if date != nil
      date.gsub!("-",",")
      date.gsub!(" ",",")
      date.gsub!(":",",")
    end
  end
  
  # Generate JSON for event
  def self.genEvent(startDate, endDate, headline, text)
    JSON.pretty_generate(
                         "startDate" => parseDate(startDate),
                         "endDate" => parseDate(endDate),
                         "headline" => headline,
                         "text" => text
                        )
  end


  # Generate JSON for timeline
  def self.genTimeline
    firstEvent = JSON.parse genEvent("2010-01-12 18:53:08", nil, "test headline", "This is the text body of the email")
    JSON.pretty_generate(
                         "timeline" => {
                           "headline" => "timeline name",
                           "type" => "default",
                           "text" => "text goes here",
                           "date" => [
                                      firstEvent
                                     ]
                         }
                       )
  end

  puts genTimeline
end
