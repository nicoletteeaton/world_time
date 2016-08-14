module ApplicationHelper

  def timezone_lookup(lat, lng)
    begin
      Timezone.lookup(lat, lng)
    rescue Timezone::Error::InvalidZone
      []
    end
  end

  def printable_time(timezone)
    if !timezone
      'Timezone is not available.'
    elsif timezone.dst?(Time.now)
      timezone.utc_to_local(Time.now).strftime("%b %d %Y %l:%M%p") + ' DST'
    else
      timezone.utc_to_local(Time.now).strftime("%b %d %Y %l:%M%p")
    end
  end
end
