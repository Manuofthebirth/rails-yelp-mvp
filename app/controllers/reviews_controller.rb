class ReviewsController < ApplicationController

	def new
		@restaurant = Restaurant.find(params[:restaurant_id])
		@review = Review.new
	end

	def create
		@review = Review.new(review_params)
        @review.restaurant = Restaurant.find(params[:restaurant_id])
		# respond_to do |format|
		if @review.save
		  redirect_to @review.restaurant
		else
			render :new
		end
	end

	private

	def review_params
		params.require(:review).permit(:content, :rating)
	end
end

	# @restaurant = Restaurant.new(restaurant_params)

	# respond_to do |format|
	# 	if @restaurant.save
	# 		format.html { redirect_to @restaurant, notice: 'Restaurant was successfully created.' }
	# 		format.json { render :show, status: :created, location: @restaurant }
	# 	else
	# 		format.html { render :new }
	# 		format.json { render json: @restaurant.errors, status: :unprocessable_entity }
	# 	end