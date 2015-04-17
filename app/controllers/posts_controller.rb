class PostsController < ApplicationController
  before_action :set_user, only: %i[index show create update destroy read]
  before_action :set_post, only: %i[show edit update destroy read]
  skip_before_action :verify_authenticity_token, only: [:show]

  # GET /posts
  # GET /posts.json
  def index
    @posts = @user.posts.order(created_at: 'desc')
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.user = current_user
    respond_to do |format|
      if @post.save
        format.js
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.js
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.js
    end
  end

  def read
    current_user.read(@post)
    render json: { status: 'ok' }
  end

  private
    def set_user
      @user = User.find(params[:user_id])
    end

    def set_post
      @post = @user.posts.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:body, :user_id)
    end
end
