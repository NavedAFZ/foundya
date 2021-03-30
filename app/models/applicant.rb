class EmailValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
      unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
        record.errors.add attribute, (options[:message] || "format is wrong")
      end
    end
end

class Applicant < ApplicationRecord
  

    belongs_to :user
    validates :email, uniqueness: true, presence: true, email: true
    validates :name, length: { minimum: 4 },presence: true,uniqueness: {case_sensitive: false}
    validates :description, length: { in:60..200,
        too_long: "%{count} characters is the maximum allowed",
        too_short: "%{count} characters is the minimum allowed" },presence: true
        validates :cv_url, presence: true
        validates :skill1,presence:{message:' minimum one skill is compulsary'}
        validates :project1,presence:{message:' minimum one project is compulsary'}

        before_save :downcase_fields

        def downcase_fields
           self.name.downcase!
        end
        

end
