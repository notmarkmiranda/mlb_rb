# frozen_string_literal: true

require "spec_helper"
require "./lib/mlb_rb/game"

RSpec.describe MlbRb::Game do
  let(:game_hash) do
    {
      gamePk: 706964,
      link: "/api/v1.1/game/706964/feed/live",
      gameType: "S",
      season: "2022",
      gameDate: "2022-03-23T17:05:00Z",
      officialDate: "2022-03-23",
      status: {
        abstractGameState: "Final",
        codedGameState: "F",
        detailedState: "Final",
        statusCode: "FT",
        startTimeTBD: false,
        reason: "Tied",
        abstractGameCode: "F"
      },
      teams: {
        away: {
          leagueRecord: {
            wins: 3,
            losses: 2,
            pct: ".600"
          },
          score: 6,
          team: {
            id: 134,
            name: "Pittsburgh Pirates",
            link: "/api/v1/teams/134"
          },
          splitSquad: false,
          seriesNumber: 6
        },
        home: {
          leagueRecord: {
            wins: 1,
            losses: 3,
            pct: ".250"
          },
          score: 6,
          team: {
            id: 116,
            name: "Detroit Tigers",
            link: "/api/v1/teams/116"
          },
          splitSquad: false,
          seriesNumber: 6
        }
      },
      venue: {
        id: 2511,
        name: "Publix Field at Joker Marchant Stadium",
        link: "/api/v1/venues/2511"
      },
      content: {
        link: "/api/v1/game/706964/content"
      },
      isTie: true,
      gameNumber: 1,
      publicFacing: true,
      doubleHeader: "N",
      gamedayType: "E",
      tiebreaker: "N",
      calendarEventID: "14-706964-2022-03-23",
      seasonDisplay: "2022",
      dayNight: "day",
      scheduledInnings: 9,
      reverseHomeAwayStatus: false,
      inningBreakLength: 120,
      gamesInSeries: 1,
      seriesGameNumber: 1,
      seriesDescription: "Spring Training",
      recordSource: "S",
      ifNecessary: "N",
      ifNecessaryDescription: "Normal Game"
    }
  end

  let(:game) { MlbRb::Game.new(deeply_stringify_keys(game_hash)) }

  it "has attributes" do
    expect(game.game_pk).to eq(706964)
    expect(game.away_team).to be_an_instance_of(MlbRb::Team)
    expect(game.home_team).to be_an_instance_of(MlbRb::Team)
    expect(game.home_score).to eq(6)
    expect(game.away_score).to eq(6)
    expect(game.game_date).to eq(Date.parse("2022-03-23"))
  end

  it "gets team names back from the game" do
    expect(game.home_team_name).to eq("Detroit Tigers")
    expect(game.away_team_name).to eq("Pittsburgh Pirates")
  end

  it "gets team ids back from the game" do
    expect(game.home_team_id).to eq(116)
    expect(game.away_team_id).to eq(134)
  end
end
