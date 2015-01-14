class ReviewsController < ApplicationController
  # before_action :authenticate_user!, only: [:new, :create]
  before_action :authenticate_user!, except: [:new, :create]

  def create
    # if you do the auth_user! correctly, you don't need to check current_user again
    if current_user
      # user review_params just like product_params
      @review = current_user.reviews.new(
        :product_id => params[:review][:product_id],
        :message => params[:review][:message],
        :rating => params[:review][:rating]
      )

      if @review.save
        # redirect_to :back 
        respond_to do |format|
          format.js { render 'create.js.erb' }
          format.html { redirect_to @review }
        end
      else
        # redirect_to :back
        respond_to do |format|
          format.js { render 'fail.js.erb' }
          format.html { redirect_to :back }
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

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id]) 
    # same here for review_params
    if @review.update(
        :message => params[:review][:message],
        :rating => params[:review][:rating]
      )
      respond_to do |format|
        format.js { render 'update.js.erb' }
        format.html { redirect_to @review }
      end
    else
      respond_to do |format|
          format.js { render 'fail.js.erb' }
          format.html { redirect_to :back }
        end
    end

  end


end
