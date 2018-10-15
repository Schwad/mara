# frozen_string_literal: true

##
# If the user's location data has gotten stale, reject if fully stale or warn if somewhat stale.
#
class CheckLocationStaleness
  include Interactor

  def call
    puts 'Update user location'
    if context.user.location_updated_at.blank?
      puts "EMPTY MESSAGE FAIL"
      context.message.reply do |reply|
        reply.text = "Woops, we have no location data for you 😟! We cannot record this data unless you 'share live location' with us, available if you click the attachment 'paperclip' in the bottom left-hand corner. Or if you want to send a one-off location sample to us, you can do that there. In general we will warn you after 10 hours, and will reject data after 16. it will probably be easiest long term to 'share live location' in the morning, and you won't get these messages any more then."
        reply.send_with(context.bot)
      end
      context.fail!
    elsif context.user.location_updated_at < 16.hours.ago
      puts 'STALE MESSAGE FAIL'
      context.message.reply do |reply|
        reply.text = "Please share your location 🌍 (or live location). Your location data is a few hours too old 👴🏼 to be reliable (Give it a moment to record after you send it ✅)"
        # reply.text = "Unfortunately your location data has gone out of date! We cannot record this data unless you 'share live location' with us, available if you click the attachment 'paperclip' in the bottom left-hand corner. Or if you want to send a one-off location sample to us, you can do that there. In general we will warn you after 10 hours, and will reject data after 16. it will probably be easiest long term to 'share live location' in the morning, and you won't get these messages any more then."
        reply.send_with(context.bot)
      end
      context.fail!
    elsif context.user.location_updated_at < 12.hours.ago
      puts 'STALE MESSAGE WARN'
      context.message.reply do |reply|
        reply.text = "Going to update your data ✅, but your location data is on the verge of becoming stale. When you get an opportunity please update location."
        reply.send_with(context.bot)
      end
    end
  end
end
