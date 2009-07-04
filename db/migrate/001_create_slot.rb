class CreateSlot < ActiveRecord::Migration
  def self.up
    create_table :slots, :force => true do |t|
      t.string :name
      t.timestamps
    end
  end

  def self.down
    drop_table :slots
  end
end
