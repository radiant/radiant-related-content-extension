module RelatedContent::RelatedContentInterface 
  def self.included(base)
    base.class_eval {
      before_filter :add_related_content_partials, :only => [:edit, :new]
      include InstanceMethods
    }
  end
  
  module InstanceMethods
    def add_related_content_partials
#      @buttons_partials ||= []
#      @buttons_partials << "attachments_box"
      include_javascript 'lowpro'
      include_javascript 'controls'
#      include_stylesheet 'admin/page_attachments'
    end
  end
end