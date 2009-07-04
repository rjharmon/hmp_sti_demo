class Slot < ActiveRecord::Base
  has_many :slot_contents
  has_many_polymorphs :slot_items, 
    :through => :slot_contents, 
    :from => [:designs, :contents]
end
