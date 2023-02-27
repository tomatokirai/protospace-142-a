class PrototypesController < ApplicationController
  def index
    @prototypes = Prototype.all
  end

  def new
  end
  
end
