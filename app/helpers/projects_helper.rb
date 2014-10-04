module ProjectsHelper
  def alertType
    {
      OFF: "OFF",
      PER_DAY: "EVERY_DAY",
      EVERY_MONDAY: "EVERY_MONDAY",
      EVERY_TUESDAY: "EVERY_TUESDAY",
      EVERY_WEDNESDAY: "EVERY_WEDNESDAY",
      EVERY_THURSDAY: "EVERY_THURSDAY",
      EVERY_FRIDAY: "EVERY_FRIDAY",
      EVERY_SATURDAY: "EVERY_SATURDAY",
      EVERY_SUNDAY: "EVERY_SUNDAY"
    }
  end
  
  def defaultAlertType
    "OFF"
  end
  
  def schedule(dayOfWeek, schedule, isShow)
    checked = false
    if schedule == nil
      schedule = 0
    end
    label = ""
    case dayOfWeek
    when 1
      checked = schedule&1 > 0
      label = "Mon"
    when 2
      checked = schedule&2 > 0
      label = "Tue"
    when 3
      checked = schedule&4 > 0
      label = "Wed"
    when 4
      checked = schedule&8 > 0
      label = "Thu"
    when 5
      checked = schedule&16 > 0
      label = "Fri"
    when 6
      checked = schedule&32 > 0
      label = "Sat"
    when 7
      checked = schedule&64 > 0
      label = "Sun"
    end
    if isShow
      if checked
        %{<li class="active"><a href="">#{label}</a></li>}.html_safe
      else
        "".html_safe
      end	
    else
      if checked
        %{
  			<label class="btn btn-primary active">
  				<input type="checkbox" name="#{label}" checked>#{label}</label>
      }.html_safe
      else
        %{
  			<label class="btn btn-primary">
  				<input type="checkbox" name="#{label}" >#{label}</label>
      }.html_safe
      end	
    end
  end
end
