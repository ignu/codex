class ChangeLanguagePropertyToModel < ActiveRecord::Migration
  def self.up
    self.remove_column(:posts, :language)
    self.add_column(:posts, :language_id, :integer)
  end

  def self.down
    self.add_column(:posts, :language, :string)
    self.remove_column(:posts, :language_id)
  end
end
