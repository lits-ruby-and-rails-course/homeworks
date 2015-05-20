require "github_api"
Github.new.repos.list(user: ARGV[0]).each do |rep|
  puts rep.name+' - '+Github.new.repos.stats.participation(ARGV[0],rep.name)[:owner].inject(0) {|memo,w_count| memo+w_count}.to_s
end
