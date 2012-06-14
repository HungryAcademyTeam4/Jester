class GithubMessagesController < ApplicationController

  def create 
    puts "#{params.inspect}"
    author          = params["commits"]["author"]["name"]
    author_username = params["commits"]["author"]["username"]
    chat_room_id    = params["id"]
    commit          = params["commits"]["message"]
    repo            = params["repository"]["name"]
    url             = params["commits"]["url"]

    msg = "#{author}(#{author_username}) pushed a commit (#{commit}) to #{repo} at #{url}."

    Message.create(:content => msg, :user_id => "github", :user => "github", :chatroom_id => "")
  end 

  def index 

  end 
end
