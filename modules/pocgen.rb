# modules/pocgen.rb
module PocGen
  def self.run
    print "Target URL (ex: https://example.com/search?q=): "
    target = gets.chomp
    print "Payload: "
    payload = gets.chomp

    puts "\n[+] Generated PoC Snippets:\n\n"

    puts "cURL:"
    puts "curl -i -s -k -X GET \"#{target}#{payload}\""

    puts "\nPython (requests):"
    puts <<~PYCODE
      import requests

      url = "#{target}"
      params = { "q": "#{payload}" }
      r = requests.get(url, params=params)
      print(r.text)
    PYCODE

    puts "\n[*] PoC generation selesai.\n\n"
  end
end
