require "application_system_test_case"

class ExercisesTest < ApplicationSystemTestCase
  setup do
    login_as users(:john)
    @workout = workouts(:today)
    @movement = movements(:squat)
    @exercise = exercises(:today_squat)

    visit workout_path(@workout)
  end

  test "Creating a new exercise" do
    assert_selector "h1", text: @workout.date.strftime('%A %d/%m/%Y %Hh%M')

    click_on "New exercise"
    select @movement.name, :from => "exercise[movement_id]"

    click_on "Create Exercise"
    assert_text @movement.name
  end

  test "Destroying an exercise" do
    assert_text @movement.name

    accept_confirm do
      within id: dom_id(@exercise, :edit) do
        click_on "delete"
      end
    end

    assert_no_text @movement.name
  end

end
