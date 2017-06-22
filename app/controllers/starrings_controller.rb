class StarringsController < ApplicationController
  def create
    @starring = Starring.new
    @starring.starrer = User.find(params[:user_id])
    @starring.illusion = Illusion.find(params[:illusion_id])
    if @starring.save
      redirect_to user_path(@starring.starrer)
    else
      @errors = @starring.errors.full_messages
      status 422
      render 'illusions#show'
    end
  end


  private
  def starring_params
    params.permit(:illusion_id)
  end
end
