module RelatedContent::RelatedContentSort

  def sort 
    @page = Page.find(params[:id])
    indices = @page.outgoing_relations.map(&:to_id)  
    @page.outgoing_relations.each_with_index do |relation, index|
      relation.position = params['related_content_container'].index(indices[index].to_s) + 1 
      relation.save 
    end 
    render :nothing => true 
  end

end