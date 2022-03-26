# frozen_string_literal: true

require "./lib/mlb_rb/team"
require "date"

module MlbRb
  class Game
    attr_reader :game_pk,
      :home_team,
      :away_team,
      :home_score,
      :away_score,
      :game_date

    def initialize(game_hash)
      @game_pk = game_hash["gamePk"]
      @home_team = Team.new(game_hash["teams"]["home"]["team"])
      @away_team = Team.new(game_hash["teams"]["away"]["team"])
      @home_score = game_hash["teams"]["home"]["score"]
      @away_score = game_hash["teams"]["away"]["score"]
      @game_date = Date.parse(game_hash["gameDate"])
    end

    def home_team_name
      home_team.name
    end

    def home_team_id
      home_team.id
    end

    def away_team_name
      away_team.name
    end

    def away_team_id
      away_team.id
    end
  end
end
