# frozen_string_literal: true

require "net/http"
require "json"

module MlbRb
  class Client
    attr_reader :json_response

    def initialize(json_response)
      @json_response = json_response
    end

    def parse_games_by_date_response
      JSON.parse(json_response)["dates"].map do |date_hash|
        date_hash["games"].map do |game|
          final_state = game["status"]["detailedState"] == "Final"
          Game.new(game) if final_state
        end
      end.flatten.compact
    end

    class << self
      def get_games_for_date(date)
        json_response = Net::HTTP.get("statsapi.mlb.com", "/api/v1/schedule/games/?sportId=1&date=#{date}")
        new(json_response).parse_games_by_date_response
      end

      def get_games_for_range(start_date, end_date)
        json_response = Net::HTTP.get("statsapi.mlb.com", "/api/v1/schedule/games/?sportId=1&startDate=#{start_date}&endDate=#{end_date}")
        new(json_response).parse_games_by_date_response
      end
    end
  end
end
