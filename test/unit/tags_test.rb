require File.dirname(__FILE__) + '/../test_helper'

class TagsTest < Test::Unit::TestCase

  test_helper :render
  fixtures :page_relations
  
  def setup
    @page = pages(:homepage)
  end
  
  def test_tags
    assert_renders 'DocumentationArchive', '<r:related:each:title/>'
    assert_renders 'Documentation', '<r:related:first:title/>'
    assert_renders 'Archive', '<r:related:last:title/>'
  end
end
