require File.dirname(__FILE__) + "/../test_helper"

class PageExtensionsTest < Test::Unit::TestCase
  fixtures :page_relations
  
  def test_should_have_related_content
    @page = Page.new
    assert_respond_to @page, :related_pages
    assert_respond_to @page, :outgoing_relations
    assert_respond_to @page, :incoming_relations
    assert_respond_to @page, :create_relations
  end
  
  def test_should_destroy_incoming_relations_when_destroyed
    @page = Page.find(2)
    assert_not_nil @page.incoming_relations
    @page.destroy
    assert PageRelation.find_all_by_to_id(2).empty?
  end
  
  def test_should_destroy_outgoing_relations_when_destroyed
    @page = Page.find(3)
    assert_not_nil @page.outgoing_relations
    @page.destroy
    assert PageRelation.find_all_by_from_id(3).empty?
  end
end