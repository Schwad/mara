# frozen_string_literal: true

##
# Primary message management organizer interactor used within MaraBot
#
class ManageMessage
  include Interactor::Organizer

  organize VerifyUser, UpdateUserLocation, HandleAnyCommands, InspectMessageValidity, CheckLocationStaleness, CheckTheWeather, RecordDataPoint, ThankTheUser
end
