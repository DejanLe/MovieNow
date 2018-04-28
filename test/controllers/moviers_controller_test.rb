require 'test_helper'

class MoviersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @movier = moviers(:one)
  end

  test "should get index" do
    get moviers_url
    assert_response :success
  end

  test "should get new" do
    get new_movier_url
    assert_response :success
  end

  test "should create movier" do
    assert_difference('Movier.count') do
      post moviers_url, params: { movier: { actors: @movier.actors, description: @movier.description, director: @movier.director, title: @movier.title, year: @movier.year } }
    end

    assert_redirected_to movier_url(Movier.last)
  end

  test "should show movier" do
    get movier_url(@movier)
    assert_response :success
  end

  test "should get edit" do
    get edit_movier_url(@movier)
    assert_response :success
  end

  test "should update movier" do
    patch movier_url(@movier), params: { movier: { actors: @movier.actors, description: @movier.description, director: @movier.director, title: @movier.title, year: @movier.year } }
    assert_redirected_to movier_url(@movier)
  end

  test "should destroy movier" do
    assert_difference('Movier.count', -1) do
      delete movier_url(@movier)
    end

    assert_redirected_to moviers_url
  end
end
