class BotCommand
  def initialize(command=nil, options=nil, user)
    @command = command
    @options = options
    @message = nil
  end

  def execute
    case command
    when 'sleep'
      sleep_notifications
    else
      @message = "We are sorry, something went wrong here. Please notify the maintainer."
    end
  end

  def sleep_notifications
    @sleep_time = @options.split(" ")[0].to_i
    @sleep_value = @options.split(" ")[1].downcase
    if sleep_command_valid?
      user.sleep_until = eval "#{@sleep_time}.#{@sleep_value}.from_now"
      user.save
      @message = "All locked in. 💤 You will not be pinged from now until at least #{user.sleep_until}"
    else
      @message = "We are sorry, your sleep command is not valid. You can sleep the system for a certain number of hours or days, an example message would be 'sleep 4 days' or 'sleep 15 hours' in that format. Please try again."
    end
  end

  def is_command?
    ['sleep'].include?(@command)
  end

  private

  def sleep_command_valid?
    return false if @sleep_time == 0
    return false if ["hours", "days"].include?(@sleep_value.strip)
    true
  end
end
