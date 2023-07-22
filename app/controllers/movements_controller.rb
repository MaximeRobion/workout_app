class MovementsController < ApplicationController
  before_action :set_movement, only: [:edit, :update, :destroy]

  def index
    @movements = current_user.movements.ordered
  end

  def new
    @movements = current_user.movements.ordered
    @movement = current_user.movements.new
  end

  def create
    @movement = current_user.movements.new(movement_params)

    if @movement.save
      respond_to do |format|
        format.html {
          redirect_to :action => 'index',
          notice: t(:create_movement_flash)
        }
        format.turbo_stream { flash.now[:notice] = t(:create_movement_flash) }
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
          notice: t(:update_movement_flash)
        }
        format.turbo_stream { flash.now[:notice] = t(:update_movement_flash) }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @movement.destroy
    respond_to do |format|
      format.html { redirect_to movements_path, notice: t(:destroy_movement_flash) }
      format.turbo_stream {flash.now[:notice] = t(:destroy_movement_flash)}
    end
  end

  private
    def movement_params
      params.require(:movement).permit(:name, :equipment_type)
    end

    def set_movement
      @movement = current_user.movements.find(params[:id])
    end
end
