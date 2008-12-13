class RelatedContentDataset < Dataset::Base
  uses :pages
  
  def load
    first = pages(:first)
    first.add_relations = [page_id(:another), page_id(:parent)]
    first.save
    parent = pages(:parent)
    parent.add_relations = [page_id(:first)]
    parent.save
  end  
end
