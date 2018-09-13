# frozen_string_literal: true

##
# If the new message contains location data, updates it against the user. Also terminates the message, as there are never messages with information and location
#
class UpdateUserLocation
  include Interactor

  def call
    puts 'Update user location'
    if context.message.location
      if location_ready_for_update
        context.user.update_columns(location_updated_at: context.message.date, location: context.message.location.full.to_s.chars[1..-2].join.delete(' '))
        context.user.save
      end
      context.fail!
    end
  end

  private

  def location_ready_for_update
    context.user.updated_at < 30.minutes.ago || context.user.created_at > 30.minutes.ago
  end
end
