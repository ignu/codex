class AddProgrammingLanguageToPost < ActiveRecord::Migration
  def self.up
    self.add_column(:posts, :language, :string)
  end

  def self.down
    self.remove_column(:posts, :language)
  end
end
