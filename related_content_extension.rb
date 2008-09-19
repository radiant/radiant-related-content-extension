# Uncomment this if you reference any of your controllers in activate
require_dependency 'application'

class RelatedContentExtension < Radiant::Extension
  version "0.1"
  description "Provides an interface and tags for relating pages to one another in a one-way fashion."
  url "http://dev.radiantcms.org/"
  define_routes do |map|
    map.related_pages 'admin/ui/pages/related', :controller => "admin/page", :action => "related"
    map.sort_related 'admin/ui/pages/sort', :controller => "admin/page", :action => "sort"
  end
  def activate
    Page.send :include, RelatedContent::PageExtensions
    Page.send :include, RelatedContent::Tags
    Admin::PageController.send :include, RelatedContent::Autocomplete
    Admin::PageController.send :include, RelatedContent::RelatedContentInterface    
    Admin::PageController.send :include, RelatedContent::RelatedContentSort
  end
  
  def deactivate
  end
  
end
