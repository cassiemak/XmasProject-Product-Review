class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

    def create
    # post = Post.find(params[:post_id])

    # @comment = current_user.comments.new(comment_params)
    # comment = Comment.new( :user => current_user, :post => post, :message => params[:message])
    @comment = current_user.comments.new(:post_id => params[:comment][:post_id], :message => params[:comment][:message])

    if @comment.save
      # redirect_to comment.post
      # render json: comment, status: 201
      # it tells the computer that it needs to render pages in the following formats
      # Added second method
      respond_to do |format|
        # order matters here, it 's oing to show the javascript (json) response first
        # in rails, the convention is that we need to create a file called 'create.js.erb' inside the comments view folder
        format.js {render 'create.js.erb'}
        format.html{ redirect_to @comment.post }
      end
    else
      respond_to do |format|
        format.js {render 'fail.js.erb'}
        format.html{ redirect_to :back}
      end
    end
  end
end
