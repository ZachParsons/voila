class IllusionsController < ApplicationController

  def index
    if params[:search]
      # .downcase, .strip, split(" "),
      search_terms = params[:search]
      search_terms_array = search_terms.strip.downcase.split(" ")

      search_terms_array.each do |search_term|
        @illusions << Illusion.where(title: search_term)
      end

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

  def show
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
