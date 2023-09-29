require "test_helper"

class DoctorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @doctor = doctors(:one)
  end

  test "should get index" do
    get doctors_url, as: :json
    assert_response :success
  end

  test "should create doctor" do
    assert_difference("Doctor.count") do
      post doctors_url, params: { doctor: { bio: @doctor.bio, consultation_fee: @doctor.consultation_fee, name: @doctor.name, profile_pic: @doctor.profile_pic, specialization: @doctor.specialization } }, as: :json
    end

    assert_response :created
  end

  test "should show doctor" do
    get doctor_url(@doctor), as: :json
    assert_response :success
  end

  test "should update doctor" do
    patch doctor_url(@doctor), params: { doctor: { bio: @doctor.bio, consultation_fee: @doctor.consultation_fee, name: @doctor.name, profile_pic: @doctor.profile_pic, specialization: @doctor.specialization } }, as: :json
    assert_response :success
  end

  test "should destroy doctor" do
    assert_difference("Doctor.count", -1) do
      delete doctor_url(@doctor), as: :json
    end

    assert_response :no_content
  end
end
