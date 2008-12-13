require File.dirname(__FILE__) + '/../spec_helper'

describe Admin::PagesController do
  dataset :users, :related_content

  before(:each) do
    login_as :developer
    @page = pages(:first)

    @first = @page.outgoing_relations[0]
    @second = @page.outgoing_relations[1]

    Page.stub!(:find).and_return(@page)
  end

  def do_sort
    post :sort, :id => page_id(:first), :related_content_container => [@second.to_id.to_s, @first.to_id.to_s]
  end

  it "assigns new positions" do
    @first.should_receive(:position=).with(2)
    @first.should_receive(:save)
    @second.should_receive(:position=).with(1)
    @second.should_receive(:save)
    do_sort
  end

end
