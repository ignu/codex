class UserPropertiesOnPosts < ActiveRecord::Migration

  def self.up
      self.add_column(:posts, :user_id, :integer)
      self.add_column(:comments, :user_id, :integer)
  end


  def self.down
      self.remove_column(:posts, :user_id)
      self.remove_column(:comments, :user_id)
  end

end