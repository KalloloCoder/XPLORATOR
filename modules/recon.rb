# modules/recon.rb
require 'net/http'
require 'uri'

module Recon
  def self.run
    print "Target URL (ex: https://example.com): "
    target = gets.chomp
    uri = URI(target)

    puts "\n[+] Recon dimulai untuk: #{target}\n\n"

    # Banner grabbing (simple GET)
    begin
      res = Net::HTTP.get_response(uri)
      puts "[BANNER] Server: #{res['server']}" if res['server']
    rescue
      puts "[!] Gagal mengambil banner."
    end

    # Directory brute force
    wordlist_file = './data/wordlist.txt'
    if File.exist?(wordlist_file)
      puts "\n[+] Directory Brute Force..."
      File.readlines(wordlist_file).each do |line|
        path = line.chomp
        begin
          test_uri = URI.join(target, path)
          r = Net::HTTP.get_response(test_uri)
          puts "[FOUND] #{test_uri}" if r.code.to_i == 200
        rescue
          # skip
        end
      end
    else
      puts "[!] Wordlist tidak ditemukan di ./data/wordlist.txt"
    end

    puts "\n[*] Recon selesai.\n\n"
  end
end
