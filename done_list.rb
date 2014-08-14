require 'active_support'
require 'active_support/core_ext'
require 'octokit'
require 'dotenv'
Dotenv.load

client = Octokit::Client.new(access_token: ENV['GITHUB_TOKEN'])
issues = client.issues(nil, state: 'closed', filter: 'assigned', per_page: 100, sort: 'updated', since: Time.now.ago(1.day).iso8601)

issues_by_repo = Hash.new { |hash, key| hash[key] = [] }
issues.each do |issue|
  issues_by_repo[issue.repository.full_name] << issue
end

issues_by_repo.each do |repo, issues|
  puts "## #{repo}"
  issues.each do |issue|
    puts "- [x] [#{issue.title}](#{issue.html_url})"
  end
  puts
end
