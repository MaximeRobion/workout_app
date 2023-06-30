class ExercisesController < ApplicationController
  before_action :set_workout
  before_action :set_movements

  def index
    @movements
  end

  def show
    @exercise = Exercise.find(params[:id])
    @movement = Movement.find(@exercise.movement_id)
    @series = Serie.where(exercise_id: @exercise.id)
    @last_exercises = Exercise.where('created_at < ?', @exercise.created_at)
    @previous_exercise_same_movement = @last_exercises&.where(movement_id: @exercise.movement_id).last
    @last_series = Serie.where(exercise_id: @previous_exercise_same_movement&.id)
  end

  def new
    @exercise = @workout.exercises.build
  end

  def create
    @exercise = @workout.exercises.create(exercise_params)
    logger.debug "New exercise: #{@exercise.attributes.inspect}"
    logger.debug "Exercise should be valid: #{@exercise.valid?}"

    if @exercise.save
      logger.info "Exercise ##{@exercise.id} created at #{Time.now.utc}"
      redirect_to workout_exercise_path(@workout, @exercise)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @exercise = Exercise.find(params[:id])
    @series = Serie.where(exercise_id: @exercise.id)

    @exercise.destroy
    logger.info "Exercise ##{@exercise.id} was deleted and now the user is going to be redirected..."
    redirect_to workout_path(@workout), status: :see_other
  end

  private
    def set_workout
      @workout = Workout.find(params[:workout_id])
    end

    def set_movements
      @movements = Movement.all
    end

    def exercise_params
      params.require(:exercise).permit(:movement_id)
    end
end
