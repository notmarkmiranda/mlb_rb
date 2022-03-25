# frozen_string_literal: true

require "./lib/mlb_rb/version"
require "./lib/mlb_rb/client"
require "./lib/mlb_rb/game"
require "json"

module MlbRb
  class Error < StandardError; end

  class DateError < StandardError; end

  class << self
    def healthcheck
      "Yup, everything is fine"
    end

    def games_for_date(options)
      date = options[:date]
      raise DateError unless validate_date(date)

      formatted_date = "#{"%02d" % date[:month]}/#{"%02d" % date[:day]}/#{date[:year]}"
      games_json = client.get_games_for_date(formatted_date)
      games = JSON.parse(games_json)["dates"].first["games"]
      games.map { |game| Game.new(game) }
    end

    private

    def validate_date(date)
      return unless date

      date.map do |key, value|
        valid_number_for_date(value, key)
      end.all?
    end

    def valid_number_for_date(date_number, type)
      if type == :year
        date_number.between?(1876, Date.today.year)
      elsif type == :month
        date_number.between?(1, 12)
      elsif type == :day
        date_number.between?(1, 31)
      end
    end

    def client
      MlbRb::Client
    end
  end
end
