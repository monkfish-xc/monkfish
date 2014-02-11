class CohortshipsController < ApplicationController
  def req
    @user = current_user
    @cohort = User.find(params[:id])
    unless @cohort.nil?
      if Cohortship.request(@user, @cohort)
        flash[:notice] = "Request sent to user #{@cohort.email}."
      else
        flash[:notice] = "Unable to send request to user #{@cohort.email}."
      end
    end
    redirect_to current_user
  end

  def destroy
    @cohortship = current_user.cohortships.find(params[:id])
    @cohortship.destroy
    flash[:notice] = "User has been removed from your list of cohorts."
    redirect_to current_user
  end
end
