ActionController::Routing::Routes.draw do |map|
  map.root({
    :controller => 'posts', 
    :action => 'new'
  })

  map.posts('/posts',{
    :controller => 'posts',
    :action     => 'create',
    :conditions => {:method => :post}
  })
  
  map.new_post('/posts/new', {
    :controller => 'posts',
    :action     => 'new',
    :conditions => {:method => :get}
  })
  
  map.post('/posts/:id', {
    :controller => 'posts',
    :action     => 'show',
    :conditions => {:method => :get}
  })
  
  map.post_comments('/posts/:post_id/comments',{
    :controller => 'comments',
    :action     => 'create',
    :conditions => {:method => :post}
  })
end
