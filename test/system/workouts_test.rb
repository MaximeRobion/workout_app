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
    fill_in "Date", with: Time.now
    fill_in "Note", with: "Fullbody, didn't eat breakfast"
    click_on "Create Workout"
    assert_selector "h1", text: "Workouts"
    assert_text "Fullbody, didn't eat breakfast"
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
end
