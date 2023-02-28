class PrototypesController < ApplicationController
  def index
    @prototypes = Prototype.all
  end

  def show
    @prototype = Prototype.find(params[:id])
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.create(prototype_params)
    if @prototype.save
      redirect_to action: :index
    else
      render new_prototype_path
    end
  end
  
  def edit
    @prototype = Prototype.find(params[:id])
    if user_signed_in? && @prototype.user_id != current_user.id
      render action: :index
    end
  end

  def update
    prototype = Prototype.find(params[:id])
    prototype.update(prototype_params)
    redirect_to action: :index
  end

  private
  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end
end
