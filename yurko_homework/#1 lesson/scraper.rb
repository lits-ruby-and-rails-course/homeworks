# encoding: utf-8
require 'mechanize'
require 'pry'
require 'colorize'

class Example
  
  PATH = "https://www.ruby-lang.org/en/examples/"

  def initialize
    @examples = %w(cities greeter i_love_ruby hello_world)
    @agent = Mechanize.new
  end

  def run
    @examples.each  do |example|
      code = get_code(PATH + "#{example}")

      # colorized output
      puts "Example '#{example}'".colorize(:red)
      code.each {|s| puts s.colorize(:green)}

      puts "\n" + "Eval '#{example}'".colorize(:cyan)
      puts "#{eval code.join "\n"}" + "\n" * 3
      sleep 2
    end
  end

  private
  
  def get_code link
    page = @agent.get link
    page.parser.css("code").text.split "\n"
  end

end

Example.new.run


