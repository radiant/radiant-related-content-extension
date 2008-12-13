require File.dirname(__FILE__) + '/../spec_helper'

describe "RelatedContentTags" do
  dataset :related_content
  
  before do
    @page = pages(:first)
  end
  
  it "renders related content" do
    @page.should render('<r:related:each:title/>').as('AnotherParent')
  end
  
  it "renders first related item" do
    @page.should render('<r:related:first:title/>').as('Another')
  end
  
  it "renders last related item" do
    @page.should render('<r:related:last:title/>').as('Parent')
  end
end