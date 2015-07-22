class PostsController < ApplicationController

  # GET /?page=:page
  def index
    @posts = Post.page(params[:page]).order('created_at DESC')
  end

  # GET /posts/new
  def new
    @post = Post.new
    @post.categories.build
  end

  # GET posts/:id
  def show
    @post = Post.find(params[:id])
  end

  # POST /posts
  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  # GET posts/:id/edit
  def edit
    @post = Post.find(params[:id])
  end

  # PATCH posts/:id
  def update
    @post = Post.find(params[:id])

    if @post.update_attributes(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  # DELETE posts/:id
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path
  end

  private
     def post_params
       params.require(:post).permit(
        :title,
        :text,
        categories_attributes: [:name]
      )
     end
end
