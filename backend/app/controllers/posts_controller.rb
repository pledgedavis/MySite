class PostsController < ApplicationController
  before_action :set_post, only: [ :show, :edit, :update, :destroy ]

  # GET /posts or /posts.json
  def index
    posts = Post.all
    render json: posts
  end

  # GET /posts/1 or /posts/1.json
  def show
    render json: @post
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params)
      if @post.save
      render json: @post, status: :created, location: @post
      else
         render json: @post.errors, status: :unprocessable_entity
     end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    
   if @post.update(post_params)
     render json: @content 
    else
      render json: @post.errors, status: :unprocessable_entity
   end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:id, :name, :description, :date, :content_id)
    end
end
