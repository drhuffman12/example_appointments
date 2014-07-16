require 'test_helper'

class ApptUploadsControllerTest < ActionController::TestCase
  setup do
    @appt_upload = appt_uploads(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:appt_uploads)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create appt_upload" do
    assert_difference('ApptUpload.count') do
      post :create, appt_upload: { content: @appt_upload.content, process_end_time: @appt_upload.process_end_time, process_start_time: @appt_upload.process_start_time }
    end

    assert_redirected_to appt_upload_path(assigns(:appt_upload))
  end

  test "should show appt_upload" do
    get :show, id: @appt_upload
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @appt_upload
    assert_response :success
  end

  test "should update appt_upload" do
    patch :update, id: @appt_upload, appt_upload: { content: @appt_upload.content, process_end_time: @appt_upload.process_end_time, process_start_time: @appt_upload.process_start_time }
    assert_redirected_to appt_upload_path(assigns(:appt_upload))
  end

  test "should destroy appt_upload" do
    assert_difference('ApptUpload.count', -1) do
      delete :destroy, id: @appt_upload
    end

    assert_redirected_to appt_uploads_path
  end
end
