# frozen_string_literal: true

require "rails_helper"

RSpec.describe User, type: :model do
  it "has a valid factory" do
    expect(build(:user).valid?).to eq true
  end

  it { is_expected.to validate_presence_of(:first_name) }
  it { is_expected.to validate_presence_of(:email) }

  it "validates uuid format" do
    expect(build(:user, id: "1").valid?).to eq false
  end

  it "validates email format" do
    expect(build(:user, email: "agood@email.com").valid?).to eq true
    expect(build(:user, email: "invalid.email").valid?).to eq false
  end
end
