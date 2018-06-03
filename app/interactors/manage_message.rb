# frozen_string_literal: true

##
# Primary message management organizer interactor used within MaraBot
#
class ManageMessage
  include Interactor::Organizer

  organize VerifyUser, HandleAnyCommands, UpdateUserLocation, CheckLocationStaleness, CheckTheWeather, RecordDataPoint, ThankTheUser
end
