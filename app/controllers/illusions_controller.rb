class IllusionsController < ApplicationController
  def index
    @masters_illusions = Illusion.all.where(intense: true)
  end

  def new
    @illusion = Illusion.new
  end

  def create
    @illusion = Illusion.new(illusion_params)
    @illusion.creator_id = session[:user_id]

    if @illusion.save
      redirect_to illusion_path, notice: "New illusion added."
    else
      @errors = @illusion.errors.full_messages
      render :new, status: 422
    end
  end

  def show
    @illusion = Illusion.find()
  end

  private
    def illusion_params
      params.require(:illusion).permit(:title, :url, :intense)
    end
end
