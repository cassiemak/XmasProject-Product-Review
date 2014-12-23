class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

    def create
    @review = current_user.comments.new(:product_id => params[:review][:product_id], :message => params[:review][:message])

    if @comment.save
      respond_to do |format|
        format.js {render 'create.js.erb'}
        format.html{ redirect_to @review.product }
      end
    else
      respond_to do |format|
        format.js {render 'fail.js.erb'}
        format.html{ redirect_to :back}
      end
    end
  end
end
