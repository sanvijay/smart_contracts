require 'test_helper'

class DiagnosisCodesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @diagnosis_code = diagnosis_codes(:one)
  end

  test "should get index" do
    get diagnosis_codes_url
    assert_response :success
  end

  test "should get new" do
    get new_diagnosis_code_url
    assert_response :success
  end

  test "should create diagnosis_code" do
    assert_difference('DiagnosisCode.count') do
      post diagnosis_codes_url, params: { diagnosis_code: { code: @diagnosis_code.code, long_desc: @diagnosis_code.long_desc, short_desc: @diagnosis_code.short_desc } }
    end

    assert_redirected_to diagnosis_code_url(DiagnosisCode.last)
  end

  test "should show diagnosis_code" do
    get diagnosis_code_url(@diagnosis_code)
    assert_response :success
  end

  test "should get edit" do
    get edit_diagnosis_code_url(@diagnosis_code)
    assert_response :success
  end

  test "should update diagnosis_code" do
    patch diagnosis_code_url(@diagnosis_code), params: { diagnosis_code: { code: @diagnosis_code.code, long_desc: @diagnosis_code.long_desc, short_desc: @diagnosis_code.short_desc } }
    assert_redirected_to diagnosis_code_url(@diagnosis_code)
  end

  test "should destroy diagnosis_code" do
    assert_difference('DiagnosisCode.count', -1) do
      delete diagnosis_code_url(@diagnosis_code)
    end

    assert_redirected_to diagnosis_codes_url
  end
end
