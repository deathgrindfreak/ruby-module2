class Profile < ActiveRecord::Base
  belongs_to :user

  validate :first_last_not_both_null, :not_male_and_sue
  validates :gender, inclusion: { in: %w(male female) }

  def first_last_not_both_null
    if first_name.nil? && last_name.nil?
      errors.add(:first_name, "Both first and last name cannot be null!")
      errors.add(:last_name, "Both first and last name cannot be null!")
    end
  end

  def not_male_and_sue
    if gender == "male" && first_name == "Sue"
      errors.add(:gender, "Boys cannot be named Sue!")
    end
  end

  def self.get_all_profiles (min, max)
    Profile.where("birth_year BETWEEN ? and ?", min, max).order(:birth_year)
  end
end
