# frozen_string_literal: true

require "./lib/mlb_rb/version"
require "./lib/mlb_rb/client"
require "./lib/mlb_rb/game"
require "json"

module MlbRb
  class Error < StandardError; end

  def self.healthcheck
    "Yup, everything is fine"
  end

  def self.games_for_date(year:, month:, day:)
    date = "#{"%02d" % month}/#{"%02d" % day}/#{year}"
    games_json = MlbRb::Client.get_games_for_date(date)
    games = JSON.parse(games_json)["dates"].first["games"]
    games.map { |game| Game.new(game) }
  end

  private

  def client
    MlbRb::Client
  end
end
