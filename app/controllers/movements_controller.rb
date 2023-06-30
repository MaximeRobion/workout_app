class MovementsController < ApplicationController
  def index
    @movements = Movement.all
  end

  def new
    @movements = Movement.all
    @movement = Movement.new
  end

  def create
    @movement = Movement.new(movement_params)

    if @movement.save
      respond_to do |format|
        format.html {
          redirect_to :action => 'index',
          notice: "Movement was successfully created."
        }
        # format.turbo_stream { flash.now[:notice] = "Date was successfully created." }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    def movement_params
      params.require(:movement).permit(:name)
    end
end
