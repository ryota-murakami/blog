class CommentsController < ApplicationController

  http_basic_authenticate_with name: "user", password: "secret", only: :destroy

 # POST /posts/:post_id/comments
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)

    redirect_to post_path(@post)
  end

 # DELETE /posts/:post_id/comments/:id
 def destroy
   @post = Post.find(params[:post_id])
   @comment = @post.comments.find(params[:id])
   @comment.destroy


   redirect_to post_path(@post)
 end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end

end
