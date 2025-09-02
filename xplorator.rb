#!/usr/bin/env ruby
# XPLORATOR - Main CLI
# Works on Termux, Linux, PowerShell

require 'io/console'

# Modules
require_relative './modules/recon'
require_relative './modules/pocgen'
require_relative './modules/obfuscator'
require_relative './modules/playground'
require_relative './modules/report'

# ANSI Colors
BLUE   = "\e[34m"
YELLOW = "\e[33m"
RESET  = "\e[0m"

# Banner ASCII
def banner
  puts "#{BLUE}▗▖  ▗▖▗▄▄▖ ▗▖    ▗▄▖ ▗▄▄▖  ▗▄▖▗▄▄▄▖▗▄▖ ▗▄▄▖"
  puts " ▝▚▞▘ ▐▌ ▐▌▐▌   ▐▌ ▐▌▐▌ ▐▌▐▌ ▐▌ █ ▐▌ ▐▌▐▌ ▐▌"
  puts "  ▐▌  ▐▛▀▘ ▐▌   ▐▌ ▐▌▐▛▀▚▖▐▛▀▜▌ █ ▐▌ ▐▌▐▛▀▚▖"
  puts "▗▞▘▝▚▖▐▌   ▐▙▄▄▖▝▚▄▞▘▐▌ ▐▌▐▌ ▐▌ █ ▝▚▄▞▘▐▌ ▐▌#{RESET}"
  puts "#{YELLOW}             𝕏ℙ𝕃𝕆ℝ𝔸𝕋𝕆ℝ - 𝕧𝟙.𝟘#{RESET}"
  puts "#{YELLOW}          𝐌𝐚𝐝𝐞 𝐛𝐲: 𝐊𝐚𝐥𝐥𝐨𝐥𝐨𝐂𝐨𝐝𝐞𝐫#{RESET}\n\n"
end

# Clear screen (cross-platform)
def clear_screen
  system('clear') || system('cls')
end

# Main Menu
def main_menu
  loop do
    puts "#{BLUE}[1]#{RESET} Recon (X-RECON)"
    puts "#{BLUE}[2]#{RESET} PoC Generator (X-POC)"
    puts "#{BLUE}[3]#{RESET} Payload Obfuscator (X-OBF)"
    puts "#{BLUE}[4]#{RESET} Playground (X-LAB)"
    puts "#{BLUE}[5]#{RESET} Report Generator (X-REPORT)"
    puts "#{BLUE}[q]#{RESET} Quit"
    print "\n#{YELLOW}>> Pilih modul: #{RESET}"
    
    choice = STDIN.gets.chomp.downcase

    case choice
when '1'  
  Recon.run
when '2'  
  PocGen.run
when '3'  
  Obfuscator.run
when '4'  
  Playground.run
when '5'  
  Report.run
when 'q'
      puts "#{YELLOW}Keluar dari XPLORATOR...#{RESET}"
      exit
    else
      puts "#{YELLOW}Pilihan tidak valid, coba lagi!#{RESET}\n\n"
    end
  end
end

# Entry point
if __FILE__ == $0
  clear_screen
  banner
  main_menu
end
