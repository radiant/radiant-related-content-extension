module RelatedContent::Autocomplete
  def related
    @pages = Page.find(:all, 
              :conditions => ["LOWER(title) LIKE ?", "%#{params[:related_content].downcase}%"], 
              :limit => 10)
    render :layout => false
  end
end
