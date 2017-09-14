class SignaturesController < ApplicationController
  require "net/https"
  require "uri"

  APPID = "wx7ce819a7353855ee".freeze

  def signature
    ticket = get_ticket(get_token)
    noncestr = "skio#{rand(99999)}"
    timestamp = Time.now.to_i
    signature = get_signature(ticket,timestamp,params[:url],noncestr)
    response.set_header('Access-Control-Allow-Origin', "*")
    respond_to do |format|
      format.json do
        render json: {ticket: ticket, nonceStr: noncestr, appid: APPID, signature: signature}
      end
    end
  end

  private

  require "open-uri"
  require 'digest/sha1'

  def get_signature(ticket, timestamp, url, noncestr)
    signaturestr = "jsapi_ticket=#{ticket}&noncestr=#{noncestr}&timestamp=#{timestamp}&url=#{url}"
    sha1 = Digest::SHA1.hexdigest(signaturestr)
  end

  def get_token
    uri = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=#{APPID}&secret=a3df8387ae58d0e4b0bf710fe4a889e8" ;
    html_response = nil
    open(uri) do |http|
      html_response = http.read
    end
    JSON.parse(html_response)["access_token"]
  end

  def get_ticket(token)
    String url = "https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token="+token+"&type=jsapi";
    html_response = nil
    open(url) do |http|
      html_response = http.read
    end
    JSON.parse(html_response)["ticket"]
  end


end
