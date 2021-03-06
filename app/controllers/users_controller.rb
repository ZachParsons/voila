class UsersController < ApplicationController
  def new
    @user = User.new
    @masters = User.where(master: true)
  end

  def create
    @user = User.new(user_params)
    if @user.check_master(user_params[:secret])
      @user.master = true
    end

    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      # @errors = @user.errors.full_messages
      # status 422
      @masters = User.where(master: true)
      render 'new'
    end
  end

  def new_master
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    if current_user == nil || current_user != @user
      redirect_to root_path
    end

    if @user.master
      @apprentices = User.all.select { |potential_apprentice| potential_apprentice.a_master == @user}
    end
  end

  private
  def user_params
    params.require(:user).permit(:stage_name, :secret, :email, :password, :master_id)
  end
end
