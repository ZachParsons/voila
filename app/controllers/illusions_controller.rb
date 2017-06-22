class IllusionsController < ApplicationController
  # def index
  # end

  def new
    @illusion = Illusion.new
  end

  def create
    p "illusion_params #{illusion_params}"
    # # "@illusion #{@illusion = Illusion.new(illusion_params)}"
    # @illusion = Illusion.new(title: illusion_params.title, url: illusion_params.url, intense: illusion_params.intense, creator_id: session[:user_id])
    # # "@illusion.creator_id #{@illusion.creator_id = session[:user_id]}"
    @illusion = Illusion.new(illusion_params)
    @illusion.creator_id = session[:user_id]

    if @illusion.save
      redirect_to @illusion.creator, notice: "New illusion added."
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
