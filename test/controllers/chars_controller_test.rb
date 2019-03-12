require 'test_helper'

class CharsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @char = chars(:one)
  end

  test "should get index" do
    get chars_url
    assert_response :success
  end

  test "should get new" do
    get new_char_url
    assert_response :success
  end

  test "should create char" do
    assert_difference('Char.count') do
      post chars_url, params: { char: { agility: @char.agility, charisma: @char.charisma, endurance: @char.endurance, intelligence: @char.intelligence, luck: @char.luck, name: @char.name, perception: @char.perception, strength: @char.strength } }
    end

    assert_redirected_to char_url(Char.last)
  end

  test "should show char" do
    get char_url(@char)
    assert_response :success
  end

  test "should get edit" do
    get edit_char_url(@char)
    assert_response :success
  end

  test "should update char" do
    patch char_url(@char), params: { char: { agility: @char.agility, charisma: @char.charisma, endurance: @char.endurance, intelligence: @char.intelligence, luck: @char.luck, name: @char.name, perception: @char.perception, strength: @char.strength } }
    assert_redirected_to char_url(@char)
  end

  test "should destroy char" do
    assert_difference('Char.count', -1) do
      delete char_url(@char)
    end

    assert_redirected_to chars_url
  end
end
