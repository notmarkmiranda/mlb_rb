# frozen_string_literal: true

require "./lib/mlb_rb/version"
require "./lib/mlb_rb/games"

module MlbRb
  class << self
    def healthcheck
      "Yup, everything is fine"
    end
  end
end
