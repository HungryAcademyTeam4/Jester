class GithubMessagesController < ApplicationController

  def create 
    author          = params["commits"].first["author"]["name"]
    author_username = params["commits"].first["author"]["username"]
    chat_room_id    = params["id"]
    commit          = params["commits"].first["message"]
    repo            = params["repository"]["name"]
    url             = params["commits"].first["url"]

    msg = "#{author}(#{author_username}) pushed a commit (#{commit}) to #{repo} at #{url}."

    Message.create(:content => msg, :user_id => "github", :user => "github", :chatroom_id => "")
  end 

  def index 

  end 
end
