require "application_system_test_case"

class WorkoutsTest < ApplicationSystemTestCase
  setup do
    login_as users(:john)
    @workout = Workout.ordered.first
  end

  test "Creating a new workout" do
    visit workouts_path
    assert_selector "h1", text: "Workouts"
    click_on "New workout"
    fill_in "Date", with: workouts(:today).date
    fill_in "Note", with: workouts(:today).note
    click_on "Create Workout"
    assert_selector "h1", text: "Workouts"
    assert_text workouts(:today).note
  end

  test "Showing a workout" do
    visit workouts_path
    click_link @workout.date.strftime('%A %d/%m/%Y')
    assert_selector "h1", text: @workout.date.strftime('%A %d/%m/%Y %Hh%M')
  end

  test "Destroying a quote" do
    visit workouts_path
    assert_text @workout.date.strftime('%A %d/%m/%Y')

    accept_alert do
      click_on "delete", match: :first
    end

    assert_no_text @workout.date.strftime('%A %d/%m/%Y')
  end

  test "Updating a workout on show page" do
    visit workouts_path
    click_link @workout.date.strftime('%A %d/%m/%Y')
    assert_selector "h1", text: @workout.date.strftime('%A %d/%m/%Y %Hh%M')

    click_on "edit", match: :first
    fill_in "Date", with: workouts(:last_week).date
    fill_in "Note", with: workouts(:last_week).note
    click_on "Update Workout"

    assert_text "h1", text: workouts(:last_week).date.strftime('%A %d/%m/%Y %Hh%M')
    assert_text workouts(:last_week).note
  end
end
