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
    # split user-inputted string
    # iterate over comma-seperated list of tags
    # create tag for each

    @illusion.tags << tag_parser(params[:illusion][:tags][:name])

    if @illusion.save
      redirect_to @illusion.creator, notice: "New illusion added."
    else
      @errors = @illusion.errors.full_messages
      render :new, status: 422
    end
  end

  def show
  end

  private
    def illusion_params
      params.require(:illusion).permit(:title, :url, :intense)
    end
    def tag_params
      params.require(:illusion).permit(:tags => :name)
    end
end
