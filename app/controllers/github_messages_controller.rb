class GithubMessagesController < ApplicationController

  def create

    parsed_payload = JSON.parse(params[:payload])

    author          = parsed_payload["head_commit"]["author"]["name"]
    author_username = parsed_payload["head_commit"]["committer"]["username"]
    chat_room_id    = params["id"]
    commit          = parsed_payload["head_commit"]["message"]
    repo            = parsed_payload["repository"]["name"]
    url             = parsed_payload["head_commit"]["url"]

    cid   = "#{chat_room_id}".to_i
    msg   = "#{author}(#{author_username}) pushed a commit (#{commit}) to #{repo} at #{url}."
    token = "ruby_jobs"

    Message.create(:message =>
                     {:content => msg,
                      :chat_room_id => cid,
                      :token => token})
  end

  def index

  end
end
