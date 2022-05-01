require "crest"
require "json"
require "../constants"

class E621
  @ua : String?

  def initialize(@blacklist : String, @useragent : String? = nil, @random : Bool? = true)
    if @useragent.nil?
      @ua = "#{Constants::USER_AGENT}"
    else
      @ua = "#{@useragent} #{Constants::USER_AGENT}"
    end
  end

  def request(tags : String)
    search = "order:random -young #{tags}"
    Crest::Request.new(
      :get,
      "#{Constants::E621_URL}/posts.json",
      user_agent: "#{@ua}",
      params: {
        :tags => search,
      }).execute
  end
end
