require File.dirname(__FILE__) + '/../test_helper'

class PageRelationTest < Test::Unit::TestCase

  def setup
    @page_relation = PageRelation.new :from => pages(:books), :to => pages(:documentation)
  end
  
  def test_should_require_an_originating_page
    @page_relation.from = nil
    assert_invalid @page_relation
  end
  
  def test_should_require_a_destination_page
    @page_relation.to = nil
    assert_invalid @page_relation
  end
end