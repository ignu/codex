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
  
  map.posts('/posts',{
    :controller => 'posts',
    :action     => 'index',
    :conditions => {:method => :get}
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

  map.users('/users/new', {
    :controller => 'users',
    :action => 'new'
  });

  map.users('/users/create', {
    :controller => 'users',
    :action => 'create',
    :conditions => {:method=>:post}
  });

  map.users('/users/login', {
    :controller => 'user_sessions',
    :action => 'new',
    :conditions => {:method=>:get}
  });

  map.resource :user_session

  map.user_sessions('/login',{
    :controller => 'user_sessions',
    :action => 'new'
  })

end
