class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def new
  end

  def create
    #new
    # authorize @review
    @review = Review.new(review_params)
    @storage_space = StorageSpace.find(params[:storage_space_id])

    if @review.save
      @storage_space.review = @review
      @storage_space.save
      redirect_to storage_space_path(@review.storage_space)
    else
      # redirect
    end
  end

  def edit
  end

  def update
    #
  end

  def destroy
    # authorize @review
    @review.destroy
  end

  private

  def set_review
    @review = Review.find(params[:id])
    # authorize @review
  end

  def review_params
    params.require(:review).permit(:description, :rating)
  end

end
