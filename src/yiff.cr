# module Yiff
#   VERSION = "0.1.0"

#   E621
#   # TODO: Put your code here
# end

require "./sites/E621"

e6 = E621.new("-young")

puts e6.request "lio"