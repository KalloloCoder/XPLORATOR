# modules/playground.rb
require 'webrick'

module Playground
  def self.run
    puts "[*] Starting X-LAB local testing server at http://localhost:8000"
    server = WEBrick::HTTPServer.new(:Port => 8000, :DocumentRoot => Dir.pwd, :Logger => WEBrick::Log.new("/dev/null"), :AccessLog => [])

    trap("INT") { server.shutdown }

    server.mount_proc '/' do |req, res|
      res.body = "<html><body><h3>XPLORATOR X-LAB</h3><p>Request path: #{req.path}</p></body></html>"
    end

    server.start
  end
end
