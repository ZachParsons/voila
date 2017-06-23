class IllusionsController < ApplicationController

  def index
    if params[:search]
      search_terms = params[:search]
      # make sure only approval show up in index
      @illusions = Illusion.where(title: params[:search], approval: true)
    else
      @illusions = Illusion.where(approval: true)
    end
  end

  def new
    @illusion = Illusion.new
  end

  def create
    @illusion = Illusion.new(illusion_params)
    @creator = User.find(session[:user_id])

    if @creator.master
      @illusion.approval = true 
    end 

    @illusion.creator = @creator

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

    if @illusion.approval == false && current_user != @illusion.creator
      render 'index'
    end
  end

  def edit 
    @illusion = Illusion.find(params[:id])
  end

  private
    def illusion_params
      params.require(:illusion).permit(:title, :url, :intense, :approval)
    end

    def tag_params
      params.require(:illusion).permit(:tags => :name)
    end

end
