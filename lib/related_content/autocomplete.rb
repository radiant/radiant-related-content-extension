module RelatedContent::Autocomplete
  def self.included(base)
    base.send(:skip_before_filter, :verify_authenticity_token, :only => 'related')
  end
  
  def related
    @pages = Page.find(:all, 
              :conditions => ["LOWER(title) LIKE ?", "%#{params[:related_content].downcase}%"], 
              :limit => 10)
    render :layout => false
  end
end
