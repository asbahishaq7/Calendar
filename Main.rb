require_relative "Year_Not_Valid.rb"
require_relative "Calendar_Display.rb"
require_relative "Event.rb"

$event_list = { }

def make_event (year, month, day)
  date = Date.new(year, month, day)
  print 'Event Name: '
  event_name = gets
  event_people = []
  person=''
  printf 'Enter People Names: (Enter "0" to end)'
  until person.eql? '0' do
      person = gets.chop
      event_people << person
  end
  event = Event.new event_name, event_people
  $event_list[date] = event
end

def display_events
  $event_list.each do |key, event|
    p event
  end
end

#START
choice = -1
while choice !=0
  #input choice from user
  choice = -1
  while !(choice.between? 0, 4)
    puts 'Options:'
    puts '0. Exit'
    puts '1. Get month'
    puts '2. Get year'
    puts '3. Make event'
    puts '4. Display all events'
    choice = gets.to_i
  end 
  if choice == 0
    puts "Thankyou for using the program"
    break
  end
  calender_display_obj = CalendarDisplay.new
  month = 01
  day = 01
  #get year and month from user
  begin 
    if choice < 4
      puts 'Please enter year'
      year = gets.to_i

      #check year range
      unless year.between? 1900, 2050
        raise YearNotValid.new
      end
    end
    case
    when choice == 1 || choice == 3
      puts 'Please enter month'
      month = gets.to_i
      unless (month.between? 1, 12)
        raise ArgumentError.new
      end
      if choice == 1
        month_events = $event_list
			.select {|key| key.strftime("%Y").to_i==year}
			.select {|key| key.strftime("%m").to_i==month}
        calender_display_obj.display_month year, month, month_events
      elsif choice == 3
        puts 'Please enter day'
        day = gets.to_i
        #check day range
        unless day.between? 1, 31
          raise ArgumentError.new
        end
        make_event year, month, day
      end
    when choice == 2
      calender_display_obj.display_year year, $event_list 
    when choice == 4
      display_events
    end
  #catch exceptions
  rescue  YearNotValid => e
    puts e.get_exception_message
    retry
  rescue ArgumentError   
    puts 'Please enter a valid date'
    retry
  end

end
