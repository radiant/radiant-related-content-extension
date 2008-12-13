require File.dirname(__FILE__) + '/../spec_helper'

describe Admin::PagesController do
  dataset :users, :related_content

  before do
    login_as :developer

    @javascripts = %w(lowpro controls dragdrop)
    @stylesheets = ['admin/related_content']
  end

  it "has related action" do
    controller.should respond_to(:related)
  end
  
  describe "handling GET related" do
    integrate_views
    
    def do_get
      get :related, :related_content => 'par'
    end
  
    it "is successful" do
      do_get
      response.should be_success
    end
  
    it "renders template without layout" do
      controller.should_receive(:render).with(:layout => false)
      do_get
    end
  
    it "renders completion" do
      do_get
      response.body.should have_tag("li##{page_id(:parent)}") do
        with_tag('span.title', pages(:parent).title)
        with_tag('span.url', pages(:parent).url)
      end
    end
  end

  describe "handling GET edit" do
    def do_get
      get :edit, :id => page_id(:first)
    end

    it "is successful" do
      do_get
      response.should be_success
    end

    it "extends page edit view with related content UI" do
      controller.should_receive(:add_related_content_partials)
      do_get
    end
  end

  describe "handling GET new" do
    def do_get
      get :new
    end

    it "is successful" do
      do_get
      response.should be_success
    end
  
    it "extends new page view with related content UI" do
      controller.should_receive(:add_related_content_partials)
      do_get
    end
  end
end
