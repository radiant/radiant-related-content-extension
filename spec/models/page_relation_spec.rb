require File.dirname(__FILE__) + '/../spec_helper'

describe "PageRelationsModel" do
  dataset :related_content
  
  describe "Page" do
    before do
      @page = pages(:first)
    end

    it "has related content" do
      @page.should respond_to(:related_pages)
      @page.should respond_to(:outgoing_relations)
      @page.should respond_to(:incoming_relations)
      @page.should respond_to(:create_relations)
    end
  
    it "has page relations" do
      @page.incoming_relations.should_not be_empty
      @page.outgoing_relations.should_not be_empty
    end
  
    it "destroys incomming relations on destroy" do
      first_id = @page.id
      @page.destroy
      PageRelation.find_all_by_to_id(first_id).should be_empty
    end
  
    it "destroys outgoing relations on destroy" do
      first_id = @page.id
      @page.destroy
      PageRelation.find_all_by_from_id(first_id).should be_empty    
    end
    
    it "deletes relations" do
      @page.delete_relations = [page_id(:another)]
      @page.save
      @page.related_pages.include?(pages(:another)).should be_false
    end
    
    it "adds relations" do
      @page.add_relations = [page_id(:child)]
      @page.save
      @page.related_pages.include?(pages(:child)).should be_true
    end
  end
  describe "PageRelation" do
    
    before do
      @page_relation = PageRelation.new :from => pages(:first), :to => pages(:another)
    end
    it "requires an originating page" do
      @page_relation.from = nil
      @page_relation.should_not be_valid
    end
    it "requires a destination page" do
      @page_relation.to = nil
      @page_relation.should_not be_valid
    end
  end
end













