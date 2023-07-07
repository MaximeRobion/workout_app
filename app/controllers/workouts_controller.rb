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
        format.html {redirect_to @workout, notice: "Workout was successfully created." }
        format.turbo_stream { flash.now[:notice] = "Workout was successfully created." }
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
        format.html { redirect_to @workout, notice: "Workout was successfully updated." }
        format.turbo_stream { flash.now[:notice] = "Workout was successfully updated." }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @workout.destroy

    respond_to do |format|
      format.html { redirect_to root_path, notice: "Workout was successfully destroyed." }
      format.turbo_stream {flash.now[:notice] = "Workout was successfully destroyed."}
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
