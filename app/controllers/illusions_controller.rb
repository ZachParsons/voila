class IllusionsController < ApplicationController
  # def index
  # end

  def new
    @illusion = Illusion.new
  end

  def create
    @illusion = Illusion.new(illusion_params)
    #make dynamic when we have user model
    @illusion.creator_id = 1
    if @illusion.save
      redirect_to @illusion, notice: "New illusion added."
    else
      @errors = @illusion.errors.full_messages
      render :new, status: 422
    end
  end

  private
    def illusion_params
      params.require(:illusion).permit(:title, :url, :intense)
    end
end
