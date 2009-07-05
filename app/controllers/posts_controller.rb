class PostsController < ApplicationController
  before_filter :require_user
  
  def show
    @post = Post.find(params[:id])
    @comment = @post.comments.build
    self.render('show')
  end
  
  def new
    @post = Post.new
    self.render('new')
  end
  
  def create
    @post = Post.new(self.params[:post])    
    @post.user = current_user
    @post.save!
    redirect_to post_path(@post)
  rescue ActiveRecord::RecordInvalid    
    render('new')
  end
end