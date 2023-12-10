# frozen_string_literal: true

class User < ApplicationRecord
  self.primary_key = "id"

  # attributes
  has_secure_password
  attr_accessor :current_password

  # hooks
  before_validation ->(u) { u.id = SecureRandom.uuid if u.id.nil? }, on: :create

  # validations

  validate :secure_password?

  validates :id, presence: true, uuid: true
  validates :first_name, presence: true
  validates :email, presence: true,
                    uniqueness: { case_sensitve: false },
                    email: true

  # @attr attr StronParams
  # @return boolean to conform with Rails update method
  # @note This method is provided to handle authentication and update via users controller
  def update_attr(attr)
    unless authenticate(attr[:current_password])
      errors.add(:current_password, "invalid password")
      return false
    end

    attr[:password].present? ? update(attr) : update(attr.tap { |a| a[:password] = a[:current_password] })
  end

  private

  def secure_password?
    return false if blank_password?

    errors.add(:password, "must be at least 12 characters long") unless @password.length >= 12
    errors.add(:password, "must include at least one capital letter") unless @password.match(/[A-Z]/)
    errors.add(:password, "must include at least one number") unless @password.match(/\d/)
  end

  def blank_password?
    result = false

    if @password.blank?
      errors.add(:password, "can't be blank")
      result = true
    end

    result
  end
end
