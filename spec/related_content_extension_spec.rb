require File.dirname(__FILE__) + '/spec_helper'

describe RelatedContentExtension do
  it "initializes" do
    RelatedContentExtension.root.should == File.join(File.expand_path(RAILS_ROOT), 'vendor', 'extensions', 'related_content')
  end
  
  it "includes RelatedContent tags" do
    Page.included_modules.include?(RelatedContent::Tags)
  end
end