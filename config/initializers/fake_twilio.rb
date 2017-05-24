require_relative '../../spec/fake_sms.rb'


if Rails.env.test?
  Twilio::REST::Client = FakeSMS
end
