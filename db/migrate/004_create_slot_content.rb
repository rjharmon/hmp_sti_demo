class CreateSlotContent < ActiveRecord::Migration
  def self.up
    create_table :slot_contents, :force => true do |t|
      t.references :slot
      t.references :slot_item, :polymorphic => true
      
      t.timestamps
    end
  end

  def self.down
    drop_table :slot_contents
  end
end
