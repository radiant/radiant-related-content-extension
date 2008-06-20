module RelatedContent::Tags
  include Radiant::Taggable
  
  tag 'related' do |tag|
    page = tag.locals.page
    tag.locals.related_pages = page.related_pages
    tag.expand
  end
  
  tag 'related:first' do |tag|
    tag.locals.page = tag.locals.related_pages.to_a.first
    tag.expand
  end

  tag 'related:last' do |tag|
    tag.locals.page = tag.locals.related_pages.to_a.last
    tag.expand
  end
  
  tag 'related:each' do |tag|
    returning String.new do |output|
      tag.locals.related_pages.each do |page|
        tag.locals.page = page
        output << tag.expand
      end
    end
  end
end
