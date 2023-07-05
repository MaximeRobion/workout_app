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
        format.turbo_stream { flash.now[:notice] = "Movement was successfully created." }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @movement = Movement.find(params[:id])
  end

  def update
    @movement = Movement.find(params[:id])

    if @movement.update(movement_params)
      respond_to do |format|
        format.html {
          redirect_to new_movement_path,
          notice: "Movement was successfully updated."
        }
        format.turbo_stream { flash.now[:notice] = "Movemenent was successfully updated." }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @movement = Movement.find(params[:id])
    @movement.destroy

    redirect_to new_movement_path, status: :see_other
  end

  private
    def movement_params
      params.require(:movement).permit(:name)
    end
end
