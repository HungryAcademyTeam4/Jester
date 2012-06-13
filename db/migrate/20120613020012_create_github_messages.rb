class CreateGithubMessages < ActiveRecord::Migration
  def change
    create_table :github_messages do |t|
      t.string :content
      t.integer :id
      t.integer :chatroom_id

      t.timestamps
    end
  end
end
