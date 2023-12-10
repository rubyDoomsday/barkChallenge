# frozen_string_literal: true

class User < ApplicationRecord
  self.primary_key = "id"

  # hooks
  before_validation ->(u) { u.id = SecureRandom.uuid if u.id.nil? }, on: :create

  # validations
  validate :secure_password?

  validates :id, presence: true, uuid: true
  validates :first_name, presence: true
  validates :email, presence: true,
                    uniqueness: { case_sensitve: false },
                    email: true

  private

  def secure_password?
    if password.blank?
      errors.add(:password, "can't be blank")
      return
    end

    errors.add(:password, "must be at least 12 characters long") unless password.length >= 12
    errors.add(:password, "must include at least one capital letter") unless password.match(/[A-Z]/)
    errors.add(:password, "must include at least one number") unless password.match(/\d/)
  end
end
