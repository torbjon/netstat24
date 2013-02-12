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

  def track_event(event)
    event = event.gsub(" ", "")
    send({method: 'track_event', event: event})
  end

  def visit
    send({method: 'visit'})
  end

  def userData(age, sex, friends, app_friends, level)
    send({method: 'user_data', age: age, gender: sex, nfr: friends, nafr: app_friends, lvl: level})
  end

end
