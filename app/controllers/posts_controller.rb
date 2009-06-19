class PostsController < ApplicationController
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
    @post.save!
    redirect_to post_path(@post)
  rescue
    render('new')
  end
end
