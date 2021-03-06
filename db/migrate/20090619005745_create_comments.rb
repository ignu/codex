class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.text          :body
      t.belongs_to    :post
      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end
