# Uncomment this if you reference any of your controllers in activate
require_dependency 'application'

class RelatedContentExtension < Radiant::Extension
  version "0.1"
  description "Provides an interface and tags for relating pages to one another in a one-way fashion."
  url "http://dev.radiantcms.org/"
  define_routes do |map|
    map.related_pages 'admin/ui/pages/related', :controller => "admin/page", :action => "related"
  end
  def activate
    Page.send :include, RelatedContent::PageExtensions
    Page.send :include, RelatedContent::Tags
    Admin::PageController.send :include, RelatedContent::Autocomplete
    admin.page.edit.add :form, 'related_content'
  end
  
  def deactivate
  end
  
end
