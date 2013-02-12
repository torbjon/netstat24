require 'net/http'
require 'uri'
require 'json'

class Netstat24
  API_URL = 'http://collector.netstat24.com/api/v2'
  attr_accessor :app_id, :access_token, :vid

  def initialize app_id, access_token, vid
    @app_id, @access_token, @vid = app_id, access_token, vid
  end

  def send(params = {})
    params[:app_id]       = app_id
    params[:access_token] = access_token
    params[:vid]          = vid

    response = JSON.parse(Net::HTTP.post_form(URI.parse(API_URL), params).body)
    raise ServerError.new self, method, params, response['error'] if response['error']
    response
  end

  def trackEvent(event)
    event = event.gsub(" ", "")
    send({method: 'track_event', event: event})
  end

  def trackValue(event, value)
    event = event.gsub(" ", "")
    send({method: 'track_value', event: event, value: value})
  end

  def trackNumber(event, value)
    event = event.gsub(" ", "")
    send({method: 'track_number', event: event, value: value})
  end

  def revenue(value)
    send({method: 'revenue', value: value})
  end

  def visit(value = nil)
    send({method: 'visit', value: value})
  end

  def install(value = nil)
    send({method: 'install', value: value})
  end

  def userData(age, sex, friends, app_friends, level)
    send({method: 'user_data', age: age, gender: sex, nfr: friends, nafr: app_friends, lvl: level})
  end

  def adClick(value)
    send({method: 'ad_click', value: value})
  end

  def inviteSent
    send({method: 'invite_sent'})
  end

  def inviteResponse
    send({method: 'invite_response'})
  end

end
