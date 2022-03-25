# frozen_string_literal: true

require "net/http"

module MlbRb
  class Client
    def self.get_games_for_date(date)
      Net::HTTP.get("statsapi.mlb.com", "/api/v1/schedule/games/?sportId=1&date=#{date}")
    end
  end
end
