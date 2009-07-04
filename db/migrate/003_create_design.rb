class CreateDesign < ActiveRecord::Migration
  def self.up
    create_table :designs, :force => true do |t|
      t.string :type
      t.string :name
      t.timestamps
    end
  end

  def self.down
    drop_table :designs
  end
end
