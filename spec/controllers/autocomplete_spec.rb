require File.dirname(__FILE__) + '/../spec_helper'

describe Admin::PagesController do
  scenario :users, :related_content

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
      controller.expect_render(:layout => false)
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
    integrate_views

    def do_get
      get :edit, :id => page_id(:first)
    end

    it "is successful" do
      do_get
      response.should be_success
    end

    it "renders related_conent partial" do
      controller.expect_render(:partial => 'related_content')
      do_get
    end

    it "includes related_content javascripts" do
      @javascripts.each { |js| controller.should_receive(:include_javascript).with(js) }
      do_get
    end

    it "includes related_content stylesheets" do
      @stylesheets.each { |css| controller.should_receive(:include_stylesheet).with(css) }
      do_get
    end
  end

  describe "handling GET new" do
    integrate_views

    def do_get
      get :new
    end

    it "is successful" do
      do_get
      response.should be_success
    end

    it "renders related_conent partial" do
      controller.expect_render(:partial => 'related_content')
      do_get
    end

    it "includes related_content javascripts" do
      @javascripts.each { |js| controller.should_receive(:include_javascript).with(js) }
      do_get
    end

    it "includes related_content stylesheets" do
      @stylesheets.each { |css| controller.should_receive(:include_stylesheet).with(css) }
      do_get
    end
  end
end
