# frozen_string_literal: true

require "rails_helper"

RSpec.describe User, type: :model do
  it "has a valid factory" do
    expect(build(:user).valid?).to eq true
  end

  it { is_expected.to have_secure_password }
  it { is_expected.to validate_presence_of(:first_name) }
  it { is_expected.to validate_presence_of(:email) }

  it "validates uuid format" do
    expect(build(:user, id: "1").valid?).to eq false
  end

  it "validates email format" do
    expect(build(:user, email: "agood@email.com").valid?).to eq true
    expect(build(:user, email: "invalid.email").valid?).to eq false
  end

  context "when updating attributes" do
    let(:user) { create(:user, password: "Password1234!") }

    it "updates attributes with a valid current password" do
      expect(user.update_attr(password: "NewPassword1234!", current_password: "Password1234!")).to be_truthy
    end

    it "fails to update attributes with an invalid current password" do
      expect(user.update_attr(password: "NewPasswrod1234!", current_password: "invalid")).to be_falsey
      expect(user.errors.full_messages).to include("Current password invalid password")
    end
  end
end
