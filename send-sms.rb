require 'rubygems'
require 'twilio-ruby'

# put your own credentials here
account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new account_sid, auth_token

message = @client.messages.create(
                             from: '+18647772014', #twilio phone number
                             to: ENV['GUS_PHONE_NUMBER'],
                             body: 'Hello there from lewagonremains'
                           )

puts message.sid
