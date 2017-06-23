class StarringsController < ApplicationController
  def create
    if session[:user_id] == nil
      redirect_to root_path
    end
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

  def destroy
    if session[:user_id] == nil
      redirect_to root_path
    end
    p "params: #{params}"
    @starring = Starring.find(params[:starrings_id])
    p @starring
    @starring.destroy
    redirect_to user_path(current_user.id)
  end

  private
  def starring_params
    params.permit(:illusion_id)
  end


end
