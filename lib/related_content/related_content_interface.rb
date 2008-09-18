module RelatedContent::RelatedContentInterface 
  def self.included(base)
    base.class_eval {
      before_filter :add_related_content_partials, :only => [:edit, :new]
      include InstanceMethods
    }
  end
  
  module InstanceMethods
    def add_related_content_partials
      @buttons_partials ||= []
      @buttons_partials << "related_content"
      include_javascript 'lowpro'
      include_javascript 'controls'
      include_stylesheet 'admin/related_content'
    end
  end
end