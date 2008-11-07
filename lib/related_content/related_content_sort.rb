module RelatedContent::RelatedContentSort

  def sort 
    @page = Page.find(params[:id])
    @page.outgoing_relations.each do |relation|
      relation.position = params['related_content_container'].index(relation.to_id.to_s) + 1 
      relation.save 
    end 
    render :nothing => true 
  end

end