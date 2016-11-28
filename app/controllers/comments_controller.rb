class CommentsController < ApplicationController
  before_action :logged_in_user
  before_action :find_micropost, only: [:create, :edit, :update, :destroy]
  before_action :find_comment, only: [:edit, :update, :destroy]
  def create
    @comment = current_user.comments.build(content: params[:comment][:content], 
                                            micropost_id: params[:micropost_id])
    if @comment.save
      respond_to do |format|
        format.js
      end
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @comment.destroy
    # flash[:success] = "Comment deleted"
    # redirect_to request.referrer || root_url
    respond_to do |format|
      format.js
    end
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
