class MovementsController < ApplicationController

  def index
    @movements = Movement.all
  end

  def new
    @movement = Movement.new
  end

  def create
    @movement = Movement.new(movement_params)

    if @movement.save
      redirect_to :action => 'index'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    def movement_params
      params.require(:movement).permit(:name)
    end
end
