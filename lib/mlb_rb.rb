# frozen_string_literal: true

require_relative "mlb_rb/version"
require_relative "mlb_rb/games"

module MlbRb
  class << self
    def healthcheck
      "Yup, everything is fine"
    end
  end
end
