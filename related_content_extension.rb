require_dependency 'application_controller'

class RelatedContentExtension < Radiant::Extension
  version "0.1"
  description "Provides an interface and tags for relating pages to one another in a one-way fashion."
  url "http://dev.radiantcms.org/"
  define_routes do |map|
    map.related_pages 'admin/ui/pages/related', :controller => "admin/pages", :action => "related"
    map.sort_related 'admin/ui/pages/sort', :controller => "admin/pages", :action => "sort"
  end
  def activate
    Page.class_eval{
      include RelatedContent::PageExtensions
      include RelatedContent::Tags
    }
    Admin::PagesController.class_eval { 
      include RelatedContent::Autocomplete
      include RelatedContent::RelatedContentInterface
      include RelatedContent::RelatedContentSort
    }
  end

  def deactivate
  end

end
