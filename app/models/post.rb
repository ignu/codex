class Post < ActiveRecord::Base
  self.belongs_to(:language)
  self.validates_presence_of(:title, :body, :language)
  self.has_many(:comments)
end
