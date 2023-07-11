require "application_system_test_case"

class MovementsTest < ApplicationSystemTestCase
  setup do
    login_as users(:john)
    @movement = Movement.ordered.first
  end

  test "Creating a new movement" do
    visit movements_path
    assert_selector "h1", text: "Movements"
    click_on "New movement"
    fill_in "Name", with: movements(:squat).name
    click_on "Create Movement"
    assert_selector "h1", text: "Movements"
    assert_text movements(:squat).name
  end

  test "Destroying a movement" do
    visit movements_path
    assert_text @movement.name

    accept_alert do
      click_on "delete", match: :first
    end

    assert_no_text @movement.name
  end

  test "Updating a movement" do
    visit movements_path
    assert_selector "h1", text: "Movements"
    click_on "edit", match: :first
    fill_in "Name", with: movements(:bench).name
    assert_selector "h1", text: "Movements"
    click_on "Update Movement"
    assert_selector "h1", text: "Movements"
    assert_text movements(:bench).name
  end

end
