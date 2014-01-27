class SynapsesController < ApplicationController
  def create
    @synapse = current_user.synapses.build(:other_user_id => params[:other_user_id])
    if @synapse.save
      redirect_to root_url, :notice => "Successfully added!"
    else
      flash[:error] = "Sorry, something went wrong. We're working on it."
      redirect_to root_url
    end
  end

  def destroy
    @synapse = current_user.synapses.find(params[:id])
    @synapse.destroy
    redirect_to current_user, :notice => "Removed connection."
  end
end
