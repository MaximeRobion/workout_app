class WorkoutsController < ApplicationController
  before_action :set_workout, only: [:show, :edit, :update, :destroy]

  def index
    @workouts = current_user.workouts.ordered
  end

  def show
    @exercises = @workout.exercises
    @movements = Movement.where(id: @exercises.pluck(:movement_id))
    @series = Serie.where(exercise_id: @exercises.pluck(:id))
  end

  def new
    @workout = current_user.workouts.new
  end

  def create
    @workout = current_user.workouts.build(workout_params)

    if @workout.save
      respond_to do |format|
        format.html {redirect_to @workout, notice: t(:create_workout_flash) }
        format.turbo_stream { flash.now[:notice] = t(:create_workout_flash) }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update

    if @workout.update(workout_params)
      respond_to do |format|
        format.html { redirect_to @workout, notice: t(:update_workout_flash) }
        format.turbo_stream { flash.now[:notice] = t(:update_workout_flash) }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @workout.destroy

    respond_to do |format|
      format.html { redirect_to root_path, notice: t(:destroy_workout_flash) }
      format.turbo_stream {flash.now[:notice] = t(:destroy_workout_flash)}
    end
  end

  private
    def workout_params
      params.require(:workout).permit(:date, :note)
    end

    def set_workout
      @workout = current_user.workouts.find(params[:id])
    end
end
