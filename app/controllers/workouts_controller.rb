class WorkoutsController < ApplicationController
  def index
    @workouts = Workout.all
  end

  def show
    @workout = Workout.find(params[:id])
    @exercises = @workout.exercises
    @movements = Movement.where(id: @exercises.pluck(:movement_id))
    @series = Serie.where(exercise_id: @exercises.pluck(:id))
  end

  def new
    @workout = Workout.new
  end

  def create
    @workout = Workout.new(workout_params)

    if @workout.save
      respond_to do |format|
        format.html {
          redirect_to @workout,
          notice: "Exercise was successfully created."
        }
        # format.turbo_stream { flash.now[:notice] = "Date was successfully created." }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @workout = Workout.find(params[:id])
  end

  def update
    @workout = Workout.find(params[:id])

    if @workout.update(workout_params)
      respond_to do |format|
        format.html {
          redirect_to @workout,
          notice: "Exercise was successfully updated."
        }
        # format.turbo_stream { flash.now[:notice] = "Date was successfully created." }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @workout = Workout.find(params[:id])
    @workout.destroy

    redirect_to root_path, status: :see_other
  end

  private
    def workout_params
      params.require(:workout).permit(:date, :note)
    end
end
