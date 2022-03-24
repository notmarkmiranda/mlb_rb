# frozen_string_literal: true

require_relative "mlb_rb/version"

module MlbRb
  class Error < StandardError; end

  def self.healthcheck
    "Yup, everything is fine"
  end
end
