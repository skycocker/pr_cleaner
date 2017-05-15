require 'pr_cleaner/version'
require 'io/console'
require 'octokit'
require 'pry'

module PrCleaner
  extend self

  def clear(repo:, pr_number:, username:)
    each_comment_of(repo, pr_number) do |comment|
      next unless comment[:user][:login] == username
      client.delete_pull_request_comment(repo, comment[:id])
    end
  end

  private

  def each_comment_of(repo, pr_number, &blk)
    client.pull_request_comments(repo, pr_number).each(&blk)
  end

  def client
    @client ||= begin
      puts 'Enter your Github login:'
      login = STDIN.gets.chomp
      puts 'Enter your Github password:'
      password = STDIN.noecho(&:gets).chomp

      puts "Removing comments created by #{ARGV[2]}, this may take a while..."

      Octokit::Client.new(login: login, password: password)
    end
  end
end
