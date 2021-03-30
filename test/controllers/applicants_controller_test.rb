require 'test_helper'

class ApplicantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @applicant = applicants(:one)
  end

  test 'should get index' do
    get applicants_url
    assert_response :success
  end

  test 'should get new' do
    get new_applicant_url
    assert_response :success
  end

  test 'should create applicant' do
    assert_difference('Applicant.count') do
      post applicants_url,
           params: { applicant: { cv_url: @applicant.cv_url, description: @applicant.description, email: @applicant.email,
                                  experience1: @applicant.experience1, experience2: @applicant.experience2, experience3: @applicant.experience3, github_url: @applicant.github_url, linked_in: @applicant.linked_in, name: @applicant.name, project1: @applicant.project1, project1_url: @applicant.project1_url, project2: @applicant.project2, project2_url: @applicant.project2_url, project3: @applicant.project3, project3_url: @applicant.project3_url, skill1: @applicant.skill1, skill2: @applicant.skill2, skill3: @applicant.skill3 } }
    end

    assert_redirected_to applicant_url(Applicant.last)
  end

  test 'should show applicant' do
    get applicant_url(@applicant)
    assert_response :success
  end

  test 'should get edit' do
    get edit_applicant_url(@applicant)
    assert_response :success
  end

  test 'should update applicant' do
    patch applicant_url(@applicant),
          params: { applicant: { cv_url: @applicant.cv_url, description: @applicant.description, email: @applicant.email,
                                 experience1: @applicant.experience1, experience2: @applicant.experience2, experience3: @applicant.experience3, github_url: @applicant.github_url, linked_in: @applicant.linked_in, name: @applicant.name, project1: @applicant.project1, project1_url: @applicant.project1_url, project2: @applicant.project2, project2_url: @applicant.project2_url, project3: @applicant.project3, project3_url: @applicant.project3_url, skill1: @applicant.skill1, skill2: @applicant.skill2, skill3: @applicant.skill3 } }
    assert_redirected_to applicant_url(@applicant)
  end

  test 'should destroy applicant' do
    assert_difference('Applicant.count', -1) do
      delete applicant_url(@applicant)
    end

    assert_redirected_to applicants_url
  end
end
