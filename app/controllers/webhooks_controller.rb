class WebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def callback
    head 200, content_type: "text/html"
    MaraBot.new.receive_webhook(incoming_message)
  end

  private

  def incoming_message
    return params['webhook']['message'] unless params['webhook']['message'].blank?
    return params['webhook']['edited_message'] unless params['webhook']['edited_message'].blank?
  end

end
