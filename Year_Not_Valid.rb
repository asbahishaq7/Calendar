class YearNotValid < StandardError

  def initialize(msg="Please enter year between 1900 and 2050")
    @msg = msg
  end

  def get_exception_message
	"Exception: Invalid Year \n#{@msg}"
  end

end
