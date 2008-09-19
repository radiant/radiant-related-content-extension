class PageRelation < ActiveRecord::Base
  belongs_to :from, :class_name => "Page", :foreign_key => "from_id" 
  belongs_to :to, :class_name => "Page", :foreign_key => "to_id"
  acts_as_list :scope => :from
  validates_presence_of :from_id, :to_id
end
