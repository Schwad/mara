# frozen_string_literal: true

##
# If the new message contains location data, updates it against the user. Also terminates the message, as there are never messages with information and location
#
class UpdateUserLocation
  include Interactor

  def call
    puts 'Update user location'
    if context.message.location
      context.user.update_columns(location_updated_at: context.message.date, location: context.message.location.full.to_s.chars[1..-2].join.delete(' '))
      context.fail!
    end
  end
end
