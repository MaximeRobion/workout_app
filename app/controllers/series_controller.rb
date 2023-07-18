class SeriesController < ApplicationController
  before_action :set_exercise
  before_action :set_workout
  before_action :set_serie, only: [:edit, :update, :destroy]

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
      respond_to do |format|
        format.html {
          redirect_to workout_exercise_path(@workout,@exercise),
          notice: "Serie was successfully created."
        }
        format.turbo_stream { flash.now[:notice] = "Date was successfully created." }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @serie = Serie.find(params[:id])
  end

  def edit
  end

  def update
    if @serie.update(serie_params)
      respond_to do |format|
        format.html {redirect_to workout_exercise_path(@workout, @exercise),notice: "Serie was successfully updated."}
        format.turbo_stream { flash.now[:notice] = "Serie was successfully created." }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @serie.destroy
    respond_to do |format|
      format.html { redirect_to workout_exercise_path(@workout,@exercise), notice: "Serie was successfully destroyed." }
      format.turbo_stream {flash.now[:notice] = "Serie was successfully destroyed."}
    end
    logger.info "Serie ##{@serie.id}) deleted at #{Time.now.utc}"
  end

  private
    def serie_params
      params.require(:serie).permit(:weight, :repetition, :is_total_weight, :movement_baseline_weight)
    end

    def set_exercise
      @exercise = Exercise.find(params[:exercise_id])
    end

    def set_workout
      @workout = Workout.find(params[:workout_id])
    end

    def set_serie
      @serie = @exercise.series.find(params[:id])
    end
end
