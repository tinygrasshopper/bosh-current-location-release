require 'sinatra'
require 'json'
require 'geoip'
require 'net/http'

geoip = GeoIP.new(File.dirname(__FILE__) + "/GeoLiteCity.dat")

get '/' do
  loc = geoip.city(Net::HTTP.get('api.ipify.org', '/'))
  "<h1>"+loc.ip + "<br/>" +
    loc.city_name + "<br/>" +
    loc.real_region_name+ "<br/>" +
    loc.country_name + "</h1>"
end
