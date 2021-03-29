json.extract! applicant, :id, :name, :email, :github_url, :linked_in, :cv_url, :description, :skill1, :skill2, :skill3, :project1, :project1_url, :project2, :project2_url, :project3, :project3_url, :experience1, :experience2, :experience3, :created_at, :updated_at
json.url applicant_url(applicant, format: :json)
