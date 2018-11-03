# frozen_string_literal: true

##
# If the user's location data has gotten stale, reject if fully stale or warn if somewhat stale.
#

class CheckLocationStaleness
  include Interactor

  def call
    if context.user.location_updated_at.blank?
      puts "EMPTY MESSAGE FAIL"
      context.message.reply do |reply|
        reply.text = "Please share your location 🌍 (or live location) so we can get the correct current weather ☔️ for you."
        reply.send_with(context.bot)
      end
      context.fail!
    elsif context.user.location_updated_at < 16.hours.ago
      context.message.reply do |reply|
        reply.text = "Please share your location 🌍 (or live location). Your location data is a few hours too old 👴🏼 to be reliable (Give it a moment to record after you send it ✅)"
        reply.send_with(context.bot)
      end
      context.fail!
    elsif context.user.location_updated_at < 12.hours.ago
      puts 'STALE MESSAGE WARN'
      context.message.reply do |reply|
        reply.text = "Updating your data ✅,\n\n Your current location is on the verge of becoming stale. 😳 \n\n When you get an opportunity please update your location."
        reply.send_with(context.bot)
      end
    end
  end
end
