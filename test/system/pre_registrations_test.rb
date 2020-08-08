require "application_system_test_case"

class PreRegistrationsTest < ApplicationSystemTestCase
  setup do
    @pre_registration = pre_registrations(:one)
  end

  test "visiting the index" do
    visit pre_registrations_url
    assert_selector "h1", text: "Pre Registrations"
  end

  test "creating a Pre registration" do
    visit pre_registrations_url
    click_on "New Pre Registration"

    fill_in "Ap", with: @pre_registration.ap
    fill_in "Bloc", with: @pre_registration.bloc
    fill_in "Cpf", with: @pre_registration.cpf
    click_on "Create Pre registration"

    assert_text "Pre registration was successfully created"
    click_on "Back"
  end

  test "updating a Pre registration" do
    visit pre_registrations_url
    click_on "Edit", match: :first

    fill_in "Ap", with: @pre_registration.ap
    fill_in "Bloc", with: @pre_registration.bloc
    fill_in "Cpf", with: @pre_registration.cpf
    click_on "Update Pre registration"

    assert_text "Pre registration was successfully updated"
    click_on "Back"
  end

  test "destroying a Pre registration" do
    visit pre_registrations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Pre registration was successfully destroyed"
  end
end
