class CommentsController < ApplicationController
  before_action :logged_in_user
  before_action :find_micropost, only: [:create, :edit, :update, :destroy]
  before_action :find_comment, only: [:edit, :update, :destroy]
  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

    def comment_params
      params.require(:comment).permit(:content)
    end

    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    def find_micropost
      @micropost = Micropost.find(params[:micropost_id])
    end

    def find_comment
      @comment = @micropost.comments.find(params[:id])
    end

end
