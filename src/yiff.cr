require "./sites/E621"

e6 = E621.new blacklist:"-feet", useragent: "Funny/v1.0.0"

result = e6.request "lio"

puts result