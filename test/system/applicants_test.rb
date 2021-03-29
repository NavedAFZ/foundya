require "application_system_test_case"

class ApplicantsTest < ApplicationSystemTestCase
  setup do
    @applicant = applicants(:one)
  end

  test "visiting the index" do
    visit applicants_url
    assert_selector "h1", text: "Applicants"
  end

  test "creating a Applicant" do
    visit applicants_url
    click_on "New Applicant"

    fill_in "Cv url", with: @applicant.cv_url
    fill_in "Description", with: @applicant.description
    fill_in "Email", with: @applicant.email
    fill_in "Experience1", with: @applicant.experience1
    fill_in "Experience2", with: @applicant.experience2
    fill_in "Experience3", with: @applicant.experience3
    fill_in "Github url", with: @applicant.github_url
    fill_in "Linked in", with: @applicant.linked_in
    fill_in "Name", with: @applicant.name
    fill_in "Project1", with: @applicant.project1
    fill_in "Project1 url", with: @applicant.project1_url
    fill_in "Project2", with: @applicant.project2
    fill_in "Project2 url", with: @applicant.project2_url
    fill_in "Project3", with: @applicant.project3
    fill_in "Project3 url", with: @applicant.project3_url
    fill_in "Skill1", with: @applicant.skill1
    fill_in "Skill2", with: @applicant.skill2
    fill_in "Skill3", with: @applicant.skill3
    click_on "Create Applicant"

    assert_text "Applicant was successfully created"
    click_on "Back"
  end

  test "updating a Applicant" do
    visit applicants_url
    click_on "Edit", match: :first

    fill_in "Cv url", with: @applicant.cv_url
    fill_in "Description", with: @applicant.description
    fill_in "Email", with: @applicant.email
    fill_in "Experience1", with: @applicant.experience1
    fill_in "Experience2", with: @applicant.experience2
    fill_in "Experience3", with: @applicant.experience3
    fill_in "Github url", with: @applicant.github_url
    fill_in "Linked in", with: @applicant.linked_in
    fill_in "Name", with: @applicant.name
    fill_in "Project1", with: @applicant.project1
    fill_in "Project1 url", with: @applicant.project1_url
    fill_in "Project2", with: @applicant.project2
    fill_in "Project2 url", with: @applicant.project2_url
    fill_in "Project3", with: @applicant.project3
    fill_in "Project3 url", with: @applicant.project3_url
    fill_in "Skill1", with: @applicant.skill1
    fill_in "Skill2", with: @applicant.skill2
    fill_in "Skill3", with: @applicant.skill3
    click_on "Update Applicant"

    assert_text "Applicant was successfully updated"
    click_on "Back"
  end

  test "destroying a Applicant" do
    visit applicants_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Applicant was successfully destroyed"
  end
end
