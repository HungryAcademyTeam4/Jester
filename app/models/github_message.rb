class GithubMessage < ActiveRecord::Base
  attr_accessible :content, :id, :chatroom_id
end
