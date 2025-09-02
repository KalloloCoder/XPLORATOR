# modules/obfuscator.rb
require 'base64'
require 'uri'

module Obfuscator
  def self.run
    print "Payload: "
    payload = gets.chomp

    # Encode methods
    url_encoded      = URI.encode_www_form_component(payload) rescue payload
    base64_encoded   = Base64.strict_encode64(payload)
    hex_encoded      = payload.unpack1('H*')
    rot13_encoded    = payload.tr("A-Za-z", "N-ZA-Mn-za-m")
    reversed_payload = payload.reverse
    double_base64    = Base64.strict_encode64(Base64.strict_encode64(payload))

    # Output
    puts "\n[+] Payload Obfuscation:"
    puts "URL Encoded     : #{url_encoded}"
    puts "Base64 Encoded  : #{base64_encoded}"
    puts "Hex Encoded     : #{hex_encoded}"
    puts "ROT13 Encoded   : #{rot13_encoded}"
    puts "Reversed String : #{reversed_payload}"
    puts "Double Base64   : #{double_base64}"
    puts "\n[*] Obfuscation selesai.\n\n"
  end
end