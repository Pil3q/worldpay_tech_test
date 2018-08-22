require 'dotenv/load'
require 'twilio-ruby'
class Message
  def self.send(offer, customer)
    account_sid = ENV['TWILIO_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    client = Twilio::REST::Client.new account_sid, auth_token

    from = ENV['MY_TWILO_NUMBER']
    to = ENV['CLIENT_NUMBER']

    client.messages.create(
      from: from,
      to: to,
      body: "Hey, I am interested in #{offer.title} and I would like to buy the product
      Kind regards
      #{customer[:name]}
      #{customer[:number]}"
    )
  end
end
