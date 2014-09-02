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
end
