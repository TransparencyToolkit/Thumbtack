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
  
  #Generate JSON for event
  def self.genEvent(sdate, edate, headline, text)
    JSON.pretty_generate(
                         "startDate" => startDate(sdate),
                         "endDate" => endDate(edate),
                         "headline" => headline,
                         "text" => text
                        )
  end


  #Generate JSON for timeline
  def self.genTimeline
    firstEvent = JSON.parse genEvent("10,10,10", nil, "test headline", "This is the text body of the email")
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
