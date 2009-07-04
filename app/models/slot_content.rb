class SlotContent < ActiveRecord::Base
  belongs_to :slot
  belongs_to :slot_item, :polymorphic => true
end
