# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base #:nodoc:
  default from: 'from@example.com'
  layout 'mailer'
end
