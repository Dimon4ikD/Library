require 'test_helper'

class BookExemplarsControllerTest < ActionController::TestCase
  setup do
    @book_exemplar = book_exemplars(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:book_exemplars)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create book_exemplar" do
    assert_difference('BookExemplar.count') do
      post :create, book_exemplar: { book_id: @book_exemplar.book_id, place_id: @book_exemplar.place_id }
    end

    assert_redirected_to book_exemplar_path(assigns(:book_exemplar))
  end

  test "should show book_exemplar" do
    get :show, id: @book_exemplar
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @book_exemplar
    assert_response :success
  end

  test "should update book_exemplar" do
    patch :update, id: @book_exemplar, book_exemplar: { book_id: @book_exemplar.book_id, place_id: @book_exemplar.place_id }
    assert_redirected_to book_exemplar_path(assigns(:book_exemplar))
  end

  test "should destroy book_exemplar" do
    assert_difference('BookExemplar.count', -1) do
      delete :destroy, id: @book_exemplar
    end

    assert_redirected_to book_exemplars_path
  end
end
