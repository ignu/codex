class CommentsController < ApplicationController
  def create
    @post    = Post.find(params[:post_id])
    @comment = @post.comments.build(params[:comment])
    @comment.save!
    respond_to do |format|
        format.html { redirect_to post_path(@post) }
        format.js   { render :head => :ok          }
    end
  rescue
    respond_to do |format|
        format.html { render('new') }
        format.js   { render :json => @comment.errors.to_json, :status => 422 }
    end
  end
end
