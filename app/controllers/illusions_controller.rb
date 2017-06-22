class IllusionsController < ApplicationController

  def index
    if params[:search]
      # .downcase, .strip, split(" "),
      search_terms = params[:search]
      @illusions = Illusion.where(title: params[:search])
    else
      @illusions = Illusion.all
    end
  end

  def new
    @illusion = Illusion.new
  end

  def create
    @illusion = Illusion.new(illusion_params)
    @illusion.creator_id = session[:user_id]
    @illusion.tags << tag_parser(params[:illusion][:tags][:name])
    if @illusion.save
      redirect_to illusion_path(@illusion), notice: "New illusion added."
    else
      @errors = @illusion.errors.full_messages
      render :new, status: 422
    end
  end

  def update
    @illusion = Illusion.find(params[:id])
    @illusion.tags << tag_parser(params[:illusion][:tags][:name])
    if @illusion.update(illusion_params)
      redirect_to @illusion
    else
      render 'edit'
    end
  end 

  def show
    @illusion = Illusion.find(params[:id])
  end

  def edit 
    @illusion = Illusion.find(params[:id])
  end

  private
    def illusion_params
      params.require(:illusion).permit(:title, :url, :intense)
    end

    def tag_params
      params.require(:illusion).permit(:tags => :name)
    end

end
