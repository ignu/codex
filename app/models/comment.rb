class Comment < ActiveRecord::Base
  self.belongs_to(:post)
  self.validates_presence_of(:body)
end
