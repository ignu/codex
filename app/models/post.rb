class Post < ActiveRecord::Base
  LANGUAGES = %w(C# Ruby PHP)
  self.validates_presence_of(:title, :body, :language)
  self.has_many(:comments)
end
