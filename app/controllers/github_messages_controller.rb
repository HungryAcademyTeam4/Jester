class GithubMessagesController < ApplicationController

  def create 
    puts "#{params.inspect}"
    author          = params["payload"]["author"]["name"]
    author_username = params["payload"]["author"]["username"]
    chat_room_id    = params["id"]
    commit          = params["payload"]["message"]
    repo            = params["payload"]["repository"]["name"]
    url             = params["payload"]["url"]

    cid = "#{chat_room_id}".to_i
    msg = "#{author}(#{author_username}) pushed a commit (#{commit}) to #{repo} at #{url}."

    Message.create(:content => msg, :user_id => "github", :user => "github", :chat_room_id => cid)
  end 

  def index 

  end 
end
