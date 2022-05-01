require "crest"
require "json"
require "../constants"

class E621
  @ua : String?
  @random_string : String?

  def initialize(
    @blacklist : String?,
    @apikey : String? = nil,
    @useragent : String? = nil,
    @random : Bool? = true
  )
    if @useragent.nil?
      @ua = "#{Constants::USER_AGENT}"
    else
      @ua = "#{@useragent} #{Constants::USER_AGENT}"
    end
  end

  def request(tags : String)
    if @random
      @random_string = "order:random"
    else
      @random_string = ""
    end
    Crest::Request.new(
      :get,
      "#{Constants::E621_URL}/posts.json",
      user_agent: "#{@ua}",
      authorization: @apikey.nil? ? nil : @apikey,
      params: {
        :tags => "#{@random_string} -young #{tags}",
      }).execute
  end
end
