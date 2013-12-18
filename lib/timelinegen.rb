require 'json'

class TimelineGen

  def initialize(input, headlinefield, textfield, startdatefield, enddatefield, timelinetitle)
    @input = input
    @textfield = textfield
    @headlinefield = headlinefield
    @startdatefield = startdatefield
    @enddatefiled = enddatefield
    @timelinetitle = timelinetitle
  end

  # Change date format to work with TimelineJS
  def parseDate(date)
    if date != nil
      date.gsub!("-",",")
      date.gsub!(" ",",")
      date.gsub!("T", ",")
      date.gsub!("Z", "")
      date.gsub!(":",",")
    end
    date
  end
  
  # Generate JSON for event
  def genEvent(startDate, endDate, headline, text)
    JSON.pretty_generate(
                         "startDate" => parseDate(startDate),
                         "endDate" => parseDate(endDate),
                         "headline" => headline,
                         "text" => text
                        )
  end

  # Parses events for timeline
  def parseEvents
    pe = JSON.parse(@input)
    k = pe.length
    event = Array.new
    (0..k-2).each do |i|
              event[i] = JSON.parse(
                              genEvent(
                                       checkSplit(@startdatefield, i, pe),
                                       checkSplit(@enddatefield, i, pe),
                                       checkSplit(@headlinefield, i, pe),
                                       checkSplit(@textfield, i, pe)
                                       )
                              )
    end
    return event
  end

  # Check to see if events should be split on comma
  def checkSplit(field, num, pe)
    if field != nil && field.include?(",")
      return split(field, num, pe)
    else 
      return (pe[num+1])[field]
    end
  end

  # Splits fields on comma and returns values
  def split(field, num, pe)
    fieldarray = field.split( /, */ )
    resultstring = ""

    fieldarray.each do |f|
      resultstring = resultstring + f + ": " + checkNil(f, num, pe) + "\n"
    end

    return resultstring
  end

  # Check to see if value exists
  def checkNil(f, num, pe)
    if (pe[num+1])[f]
      return (pe[num+1])[f].to_s
    else return ""
    end
  end
  
  # Gets the headline
  def parseHeadline
    headline = @timelinetitle
  end

  # Generates full timeline JSON
  def genTimeline(event, headline)
    JSON.pretty_generate(
                         "timeline" => {
                           "headline" => headline,
                           "type" => "default",
                           "text" => "   ",
                           "date" => event
                         }
                       )
  end

  def timeline
    event = parseEvents
    headline = parseHeadline
    genTimeline(event, headline)
  end
end
