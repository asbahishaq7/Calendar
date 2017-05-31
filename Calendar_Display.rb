require_relative "Calender_Logic.rb"

class CalendarDisplay

  def display_month (year, month, month_events)
    calender_obj = CalenderLogic.new
    month_name = calender_obj.get_month_name year, month
    start_week_day = calender_obj.get_start_week year, month
    total_days = calender_obj.get_days year, month
    puts "#{month_name}, #{year}"
    puts 'S  M  T  W  T  F  S'
    unless(start_week_day == 7)
      start_week_day.times do
        printf '   '
      end
    end
    total_days.times do |i|
      printf "#{i+1} "
      if i + 1 < 10
        printf ' '
      end
      if ((i + 1) + start_week_day)%7 == 0
        printf "\n"
      end
    end
    puts "\n"
    puts "EVENTS:- "
    month_events.each do |key, event|
      puts "Name: #{event.name}"
      puts "People: #{event.people}"
    end
  end

  def display_year (year, event_list)
    12.times do |x|
      month_events = event_list
		     .select { |key| key.strftime("%Y").to_i == year }
		     .select { |key| key.strftime("%m").to_i == x + 1}
      display_month  year, x + 1, month_events
      puts
    end
  end

end
