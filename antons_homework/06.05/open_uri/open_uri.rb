require "openssl"
require "open-uri"
require "sanitize"

uri = URI.parse("https://www.ruby-lang.org/en/")
source = ""
open('https://www.ruby-lang.org/en/', {ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE}) {|f|
  f.each_line do |line|
    if line.match(/<span class="[[:alnum:]][[:alnum:]]">/)
      source += line
    end
  end
  source = Sanitize.fragment(source)
 # File.write('parseSource.txt', source)
  puts source
}
