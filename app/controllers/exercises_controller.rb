class ExercisesController < ApplicationController
  before_action :set_workout
  before_action :set_movements

  def index
    @movements
  end

  def show
    @exercise = Exercise.find(params[:id])
    @movement = Movement.find(@exercise.movement_id)
    @series = Serie.where(:exercise_id => @exercise.id)
  end

  def new
    @exercise = @workout.exercises.build
  end

  def create
    @exercise = @workout.exercises.create(exercise_params)

    if @exercise.save
      redirect_to :action => "show", :id => @exercise
    else
      render :new, status: :unprocessable_entity
    end
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
