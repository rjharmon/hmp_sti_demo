Factory.sequence :design_name do |n|
  "Design #{n}"
end
Factory.sequence :slot_name do |n|
  "Slot #{n}"
end

Factory.define :design do |f|
  f.name { |f| f.sequence(:design_name) }
end
Factory.define :content do |f|
end
Factory.define :slot do |f|
  f.name { |f| f.sequence(:slot_name) }
end
Factory.define :slot_content do |f|
  f.slot { |f| f.association( :slot ) }
  f.slot_item { |f| f.association( :content ) }
end

