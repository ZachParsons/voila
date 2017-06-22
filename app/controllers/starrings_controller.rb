class StarringsController < ApplicationController
  def create
    p params
    p starring_params
    @starring = Starring.new(starring_params)
    @starring.starrer = current_user
    @starring.illusion = Illusion.find(starring_params[:illusion_id])
    if @starring.save
      redirect_to user_path
    else
      @errors = @starring.errors.full_messages
      status 422
      render 'illusions#show'
    end
  end


  private
  def starring_params
    params.require(:starring).permit(:illusion_id, :user_id)
  end
end
