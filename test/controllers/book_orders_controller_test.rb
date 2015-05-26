require 'test_helper'

class BookOrdersControllerTest < ActionController::TestCase
  setup do
    @book_order = book_orders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:book_orders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create book_order" do
    assert_difference('BookOrder.count') do
      post :create, book_order: { book_exemplar_id: @book_order.book_exemplar_id, user_id: @book_order.user_id }
    end

    assert_redirected_to book_order_path(assigns(:book_order))
  end

  test "should show book_order" do
    get :show, id: @book_order
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @book_order
    assert_response :success
  end

  test "should update book_order" do
    patch :update, id: @book_order, book_order: { book_exemplar_id: @book_order.book_exemplar_id, user_id: @book_order.user_id }
    assert_redirected_to book_order_path(assigns(:book_order))
  end

  test "should destroy book_order" do
    assert_difference('BookOrder.count', -1) do
      delete :destroy, id: @book_order
    end

    assert_redirected_to book_orders_path
  end
end
