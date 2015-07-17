class DonationController < ApplicationController
  def create
  	@donation = Donation.new(donation_params)

    respond_to do |format|

      if @donation.save
        format.html { redirect_to @donatino, notice: 'Project item comment was successfully created.' }
        format.json { render :show, status: :created, location: @donation }
      else
        format.html { render :new }
        format.json { render json: @donation.errors, status: :unprocessable_entity }
      end

    end
  end
end
