class ReviewsController < ApplicationController
  before_action :authenticate_user!, except: [:new, :create]

  def create

    if current_user 
      @review = current_user.reviews.new(
        :product_id => params[:review][:product_id],
        :message => params[:review][:message],
        :rating => params[:review][:rating]
      )

      if @review.save
        # redirect_to :back 
        respond_to do |format|
          format.js {render 'create.js.erb'}
          format.html{ redirect_to @review }
        end
      else
        # redirect_to :back
        respond_to do |format|
          format.js {render 'fail.js.erb'}
          format.html{ redirect_to :back}
        end
      end
    else
      redirect_to new_user_session_path 
      # alert 'Please log in to add a review'
      # flash.now[:error] = 'NOOOOOO'
      # render :create
    end
  end

  def destroy
     @review = Review.find(params[:id]) 
     @review.destroy
  end

  def update
    
  end

end
