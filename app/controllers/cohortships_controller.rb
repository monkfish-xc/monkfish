class CohortshipsController < ApplicationController
  def create
    @cohortship = current_user.cohortships.build(:cohort_id => params[:cohort_id])
    if @cohortship.save
      flash[:notice] = "Request sent to user."
      redirect_to root_url
    else
      flash[:error] = "Unable to send request to user."
      redirect_to root_url
    end
  end

  def destroy
    @cohortship = current_user.cohortships.find(params[:id])
    @cohortship.destroy
    flash[:notice] = "This user has been removed from your list of cohorts."
    redirect_to current_user
  end
end
