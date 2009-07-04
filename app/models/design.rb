class Design < ActiveRecord::Base
  has_many :slot_placements, :class_name => "SlotContents", :as => :renderable
  
  def thingy
    "base"
  end
end

class DesignTypeA < Design
  def thingy
    "typeA"
  end
end

class DesignTypeB < Design
  def thingy
    "typeB"
  end
end