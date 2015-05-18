require 'github_api'
require 'benchmark'

### Creating Github object without authentication
@github = Github.new

@username_list = []

### Take every user from command line and store in array
ARGV.each {|username| @username_list << username}

### main method wich provides calculation and output of the app
def get_commits(username)
  author = username
  year_commit_list = []
  total_commit_count = 0

  repos_names = []
  ### Using 'github_api' gem for fetching names out of GET request to api.github.com
  @github.repos.list(user: author) {|repo| repos_names << repo[:name]}

  repos_names.each_with_index do |repo_name, index|
    ### Using 'github_api' gem for fetching stats, for particular user and repository name, which is taken from 'repos_names' array
    commits = @github.repos.stats.participation(user: author, repo: repo_name)
    ### Counting all commits for a year(for current repository) just for owner
    owner_commits_count = commits[:owner].inject(0) {|memo, i| memo + i}
    year_commit_list << "#{index+1})#{repo_name} - #{owner_commits_count}"
    ### Counting total number of commits for specific user, for all his public repositories withing a year period
    total_commit_count += owner_commits_count
  end

  puts "Owner name: #{author}"
  puts "----------------------"
  year_commit_list.each {|item| puts item}
  puts "----------------------"
  puts "Total for a year: #{total_commit_count} commits"
  puts "----------------------"
end

### Measuring time for running get_commits() method, for number of usernames, which are set through command line
@benchmark = Benchmark.measure do
  @username_list.each {|username| get_commits(username) }
end

puts @benchmark