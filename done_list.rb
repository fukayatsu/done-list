require 'active_support'
require 'active_support/core_ext'
require 'octokit'
require 'dotenv'
Dotenv.load

client = Octokit::Client.new(access_token: ENV['GITHUB_TOKEN'])
issues = client.issues(nil, state: 'all', filter: 'subscribed', per_page: 100, sort: 'updated', since: Time.now.ago(1.day).iso8601)

issues_by_repo = Hash.new { |hash, key| hash[key] = [] }
issues.each do |issue|
  name = "#{issue.repository.full_name}/#{issue.pull_request ? 'pull' : 'issues'}"
  issues_by_repo[name] << issue
end

issues_by_repo.sort.each do |repo, issues|
  puts "## #{repo}"
  issues.each do |issue|
    mark = (issue.state == 'closed') ? 'x' : ' '
    puts "- [#{mark}] [#{issue.title} by #{issue.user.login}](#{issue.html_url})"
  end
  puts
end
