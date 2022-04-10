require "spec_helper"

RSpec.describe MlbRb::Games do
  describe ".games_for_date" do
    let(:file) { File.read("./spec/fixtures/api_v1_schedule_2022-03-23.json") }
    it "gets the games for a specific date" do
      expect(Net::HTTP).to receive(:get)
        .with("statsapi.mlb.com", "/api/v1/schedule/games/?sportId=1&date=03/23/2022")
        .and_return(file)

      games = described_class.games_for_date({date: {year: 2022, month: 3, day: 23}})

      expect(games.length).to eq(14)

      first_game = games.first
      expect(first_game.game_pk).to eq(706964)
      expect(first_game.home_team.name).to eq("Detroit Tigers")
      expect(first_game.away_team.name).to eq("Pittsburgh Pirates")
      expect(first_game.home_score).to eq(6)
      expect(first_game.away_score).to eq(6)
      expect(first_game.game_date).to eq(Date.new(2022, 0o3, 23))
    end

    it "raises an error when date is incorrect" do
      expect { described_class.games_for_date({date: {year: 2022, month: 13, day: 23}}) }.to raise_error(MlbRb::DateError)
    end
  end

  describe ".games_for_date_range" do
    let(:file) { File.read("./spec/fixtures/api_v1_schedule_2022-03-23_2022-03-24.json") }
    it "gets the games for a specific date range" do
      expect(Net::HTTP).to receive(:get)
        .with("statsapi.mlb.com", "/api/v1/schedule/games/?sportId=1&startDate=03/23/2022&endDate=03/24/2022")
        .and_return(file)

      games = described_class.games_for_date_range(
        {
          start_date: {year: 2022, month: 3, day: 23},
          end_date: {year: 2022, month: 3, day: 24}
        }
      )

      expect(games.length).to eq(25)

      last_game = games.last
      expect(last_game.game_pk).to eq(706896)
      expect(last_game.home_team.name).to eq("New York Mets")
      expect(last_game.away_team.name).to eq("Miami Marlins")

      expect(last_game.home_score).to eq(9)
      expect(last_game.away_score).to eq(3)
      expect(last_game.game_date).to eq(Date.new(2022, 0o3, 24))
    end
  end
end
