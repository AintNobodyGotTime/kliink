class DonationController < ApplicationController
  def create
  	donation = Donation.new
    donation.amount = params[:amount]
    donation.user_id = params[:user_id]
    donation.project_id = params[:project_id]

    if donation.save
      ps = PointSource.new
      ps.user_id = params[:user_id]
      ps.project_id = params[:project_id]
      ps.source = "donation"
      ps.points = 5 * donation.amount
      ps.save

      user = current_user
      user.total_points += 5 * donation.amount
      user.save
    end

    respond_to do |format|

      if donation.save
        format.html { redirect_to '/', notice: 'Donation was successfully created.' }
        format.json { render :show, status: :created, location: donation }
      else
        format.html { render :new }
        format.json { render json: donation.errors, status: :unprocessable_entity }
      end

    end
  end
end
