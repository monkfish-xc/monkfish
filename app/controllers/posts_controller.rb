class PostsController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy] # app/helpers/sessions_helper.rb
  before_action :correct_user, only: :destroy

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "Post created!"
      redirect_to root_url
    else
      # _feed.html.erb partial in the home view expects an @feed_items variable
      # Pass an empty array on a failed submission so it doesn't break
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    @post.destroy
    redirect_to root_url
  end

  private

    def post_params
      params.require(:post).permit(:content, :title, :post_text)
    end

    def correct_user
      @post = current_user.posts.find_by(id: params[:id])
      redirect_to root_url if @post.nil?
    end
end
