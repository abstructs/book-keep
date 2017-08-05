class AddFollowersAndFollowingToUsers < ActiveRecord::Migration[5.1]
  def change
    add_reference :users, :followers, foreign_key: true
    add_reference :users, :following, foreign_key: true
  end
end
