module RelatedContent::Tags
  include Radiant::Taggable
  
  tag 'related' do |tag|
    page = tag.locals.page
    tag.locals.related_pages = page.related_pages
    tag.expand
  end

  desc %{
    Renders the first related page. 
    
    *Usage:*
    <pre><code><r:related:first>...</r:related:first></code></pre>
  }
  tag 'related:first' do |tag|
    tag.locals.page = tag.locals.related_pages.to_a.first
    tag.expand
  end
  
  desc %{
    Renders the last related page. 
    
    *Usage:*
    <pre><code><r:related:last>...</r:related:last></code></pre>
  }
  tag 'related:last' do |tag|
    tag.locals.page = tag.locals.related_pages.to_a.last
    tag.expand
  end

  desc %{
    Cycles through each of the related pages and renders them.
    
    *Usage:*
    <pre><code><r:related:each>...</r:related:each></code></pre>
  }
  tag 'related:each' do |tag|
    returning String.new do |output|
      tag.locals.related_pages.each do |page|
        tag.locals.page = page
        output << tag.expand
      end
    end
  end
end
