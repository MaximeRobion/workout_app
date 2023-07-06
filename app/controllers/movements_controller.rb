class MovementsController < ApplicationController
  before_action :set_movement, only: [:edit, :update, :destroy]

  def index
    @movements = Movement.ordered
  end

  def new
    @movements = Movement.ordered
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
  end

  def update
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
    @movement.destroy
    respond_to do |format|
      format.html { redirect_to movements_path, notice: "Movement was successfully destroyed." }
      format.turbo_stream {flash.now[:notice] = "Movement was successfully destroyed."}
    end
  end

  private
    def movement_params
      params.require(:movement).permit(:name)
    end

    def set_movement
      @movement = Movement.find(params[:id])
    end
end
