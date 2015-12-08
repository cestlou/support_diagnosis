class IssuesController < ApplicationController
  before_filter :get_jira_client
  def index
	puts @project
  end

  def show
  	@client
    # @issue = @boards.Issue.find(params[:id])
  end

  def hello
  	@name = "Luna"
  end
end
