class IllusionsController < ApplicationController

  def index
    if params[:search]
      searched_terms = params[:search]
      stripped = searched_terms.strip

      # working on multi-word searching
      # stripped_split = stripped.split(" ")
      # stripped_split.each do |term|
      #   @illusions << Illusion.search(term)
      # end

      # make sure only approval show up in index
      # @illusions = Illusion.where(title: params[:search], approval: true)

      @illusions = Illusion.search(stripped)

    else
      @illusions = Illusion.where(approval: true)
    end
  end

  def new
    @illusion = Illusion.new
    if session[:user_id] == nil
      redirect_to root_path
    end
  end

  def create

    if session[:user_id] == nil
      redirect_to root_path
    end

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
      # @errors = @illusion.errors.full_messages
      render "new"
    end
  end

  def update
    if session[:user_id] == nil
      redirect_to root_path
    end
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
    if current_user == nil
      redirect_to new_session_path
    end

    @illusion = Illusion.find(params[:id])

    # all of the unallowed people
    if current_user == @illusion.creator || current_user == @illusion.creator.a_master
      # all good
    else
      redirect_to new_session_path
    end
  end

  private
    def illusion_params
      params.require(:illusion).permit(:title, :url, :intense, :approval)
    end

    def tag_params
      params.require(:illusion).permit(:tags => :name)
    end

end
