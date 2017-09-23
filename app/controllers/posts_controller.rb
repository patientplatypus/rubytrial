class PostsController < ApplicationController
  # before_action only: [:show, :update, :destroy, :create] do
  #   :find_user
  # end
  # before_action :require_login
  # before_action
  # before_action do
  #   :find_user
  # end

  # before_action :find_user except: []

  # GET /posts
  def index
    @posts = Post.all
    render json: @posts
  end

  # GET /posts/1
  def show
    render json: @post
  end

  # POST /posts
  def create
    # @post = Post.new(post_params)
    # @post = @user.posts.create(post_params)
    @post = User.find_by(email: params[:user_email]).posts.create(post_params)
    if @post.save
      render json: @post, status: :created, location: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/1
  def update

    @post = user.posts.update(post_params)

    if @post.update(post_params)
      render json: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
  end

  private
    def find_user
      @user =  User.find_by email: params[:user_email]
    end

    def post_params
      params.require(:post).permit(:post_title, :post_body, :user_email)
    end
end
