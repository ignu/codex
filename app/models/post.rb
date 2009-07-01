class Post < ActiveRecord::Base
  self.belongs_to(:language)
  self.belongs_to(:user)
  self.validates_presence_of(:title, :body, :language)
  self.has_many(:comments)

  def language_name=(language_name)
    @language = Language.find_or_create_by_name(language_name)
    self.language = @language
  end
end
