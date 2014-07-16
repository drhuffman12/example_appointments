require 'test_helper'

class ApptSchedsControllerTest < ActionController::TestCase
  setup do
    @appt_sched = appt_scheds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:appt_scheds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create appt_sched" do
    assert_difference('ApptSched.count') do
      post :create, appt_sched: { start_time: @appt_sched.start_time + 10, end_time: @appt_sched.end_time + 10, first_name: @appt_sched.first_name,  last_name: @appt_sched.last_name, comments: @appt_sched.comments}
    end

    assert_redirected_to appt_sched_path(assigns(:appt_sched))
  end

  test "should show appt_sched" do
    get :show, id: @appt_sched
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @appt_sched
    assert_response :success
  end

  test "should update appt_sched" do
    patch :update, id: @appt_sched, appt_sched: { start_time: @appt_sched.start_time + 10, end_time: @appt_sched.end_time + 10, first_name: @appt_sched.first_name,  last_name: @appt_sched.last_name, comments: 'test.' + @appt_sched.comments}
    assert_redirected_to appt_sched_path(assigns(:appt_sched))
  end

  test "should destroy appt_sched" do
    assert_difference('ApptSched.count', -1) do
      delete :destroy, id: @appt_sched
    end

    assert_redirected_to appt_scheds_path
  end
  
end
