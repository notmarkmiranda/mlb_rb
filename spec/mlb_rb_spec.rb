# frozen_string_literal: true

RSpec.describe MlbRb do
  it "has a version number" do
    expect(MlbRb::VERSION).not_to be nil
  end

  it "has a healthcheck method that returns a string" do
    healthcheck = MlbRb.healthcheck

    expect(healthcheck).to eq("Yup, everything is fine")
  end
end
