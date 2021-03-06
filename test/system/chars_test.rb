require "application_system_test_case"

class CharsTest < ApplicationSystemTestCase
  setup do
    @char = chars(:one)
  end

  test "visiting the index" do
    visit chars_url
    assert_selector "h1", text: "Chars"
  end

  test "creating a Char" do
    visit chars_url
    click_on "New Char"

    fill_in "Agility", with: @char.agility
    fill_in "Charisma", with: @char.charisma
    fill_in "Endurance", with: @char.endurance
    fill_in "Intelligence", with: @char.intelligence
    fill_in "Luck", with: @char.luck
    fill_in "Name", with: @char.name
    fill_in "Perception", with: @char.perception
    fill_in "Strength", with: @char.strength
    click_on "Create Char"

    assert_text "Char was successfully created"
    click_on "Back"
  end

  test "updating a Char" do
    visit chars_url
    click_on "Edit", match: :first

    fill_in "Agility", with: @char.agility
    fill_in "Charisma", with: @char.charisma
    fill_in "Endurance", with: @char.endurance
    fill_in "Intelligence", with: @char.intelligence
    fill_in "Luck", with: @char.luck
    fill_in "Name", with: @char.name
    fill_in "Perception", with: @char.perception
    fill_in "Strength", with: @char.strength
    click_on "Update Char"

    assert_text "Char was successfully updated"
    click_on "Back"
  end

  test "destroying a Char" do
    visit chars_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Char was successfully destroyed"
  end
end
