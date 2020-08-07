class PostsController < ApplicationController
    include PostsHelper
    before_action :authenticate_user!, except: [:index]

def index
    @posts = Post.all
    # .order("created_at DESC")
    @post = Post.new
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(posts_params)
    @post.save
    redirect_to posts_path

    #respond_to do |format|
    #  if @post.save
    #    format.html { redirect_to root_path, notice: 'Post was successfully created.' }
    #    format.json { render :show, status: :created, location: @post }
    #  else
    #    format.html { render :new }
    #    format.json { render json: @post.errors, status: :unprocessable_entity }
    #  end
    #end
  end
end
