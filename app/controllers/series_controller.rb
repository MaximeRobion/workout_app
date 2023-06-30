class SeriesController < ApplicationController
  before_action :set_exercise
  before_action :set_workout

  def index
    @series = Serie.all
  end

  def new
    @serie = @exercise.series.build
  end

  def create
    @serie = @exercise.series.create(serie_params)
    logger.debug "New serie: #{@exercise.attributes.inspect}"
    logger.debug "Serie should be valid: #{@exercise.valid?}"

    if @serie.save
      logger.info "Serie ##{@serie.id}) created at #{Time.now.utc}"
      redirect_to workout_exercise_path(@workout,@exercise)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @serie = Serie.find(params[:id])
  end

  def edit
    @serie = Serie.find(params[:id])
  end

  def update
    @serie = Serie.find(params[:id])

    if @serie.update(serie_params)
      redirect_to workout_exercise_path(@workout,@exercise)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @serie = Serie.find(params[:id])
    @serie.destroy
    logger.info "Serie ##{@serie.id}) deleted at #{Time.now.utc}"
    redirect_to workout_exercise_path(@workout,@exercise), status: :see_other
  end

  private
    def serie_params
      params.require(:serie).permit(:weight, :repetition)
    end

    def set_exercise
      @exercise = Exercise.find(params[:exercise_id])
    end

    def set_workout
      @workout = Workout.find(params[:workout_id])
    end
end
