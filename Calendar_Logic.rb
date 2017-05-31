require 'date'

class CalenderLogic

  def get_start_week (year, month)
    date = Date.new(year, month, 1)
    start_week_day = date.cwday
  end
  
  def get_days (year, month)
    total_days = Date.new(year, month, -1).day
  end

  def get_month_name (year,month)
    date = Date.new(year, month, 1)
    date.strftime("%B")
  end

end
