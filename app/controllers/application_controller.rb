class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  Dotenv.load


  private

  def get_jira_client
    username = ENV["APPTENTIVE_LOGIN"]
    password = ENV["APPTENTIVE_PASSWORD"]
    options = {
                :username => username,
                :password => password,
                :site     => 'https://apptentive.atlassian.net',
                :context_path => '/',
                :auth_type => :basic
              }

    @client = JIRA::Client.new(options)
    @support_board = @client.Project.find('SUPPORT')
    @issues = @client.Issue.all
    @code_bug = []
    @issues.each do |issue|
      issue.labels.include? 'code_bug'
      @code_bug.push(issue.summary)
      puts @code_bug
    end
    @boards = @client.Project.all
  end
end
