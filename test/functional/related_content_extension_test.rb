require File.dirname(__FILE__) + '/../test_helper'

class RelatedContentExtensionTest < Test::Unit::TestCase
  
  def test_initialization
    assert_equal File.join(File.expand_path(RAILS_ROOT), 'vendor', 'extensions', 'related_content'), RelatedContentExtension.root
    assert_equal 'Related Content', RelatedContentExtension.extension_name
  end
  
  def test_global_tags_existence
    assert_global_tag_module RelatedContent::Tags
  end
end
