class CreateContent < ActiveRecord::Migration
  def self.up
    create_table :contents, :force => true do |t|
      t.string :type
      t.timestamps
    end
  end

  def self.down
    drop_table :contents
  end
end
