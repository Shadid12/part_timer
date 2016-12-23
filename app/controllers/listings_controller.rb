class ListingsController < ApplicationController
    def new
      @listing = Listing.new
    end
    
    def create
        @listing = current_user.listings.new(listing_params)
        respond_to do |format|
          if @listing.save
            format.html { redirect_to @listing, notice: 'Listing was successfully created.' }
            format.json { render :show, status: :created, location: @listing }
          else
            format.html { render :new }
            format.json { render json: @listing.errors, status: :unprocessable_entity }
          end
        end
    end
    
    def show
      @listing = Listing.find(params[:id])
    end
    
    private 
    
    def listing_params
      params.permit(:title, :description)
    end
end
