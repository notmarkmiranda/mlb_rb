# frozen_string_literal: true

RSpec.describe MlbRb do
  it "has a version number" do
    expect(MlbRb::VERSION).not_to be nil
  end

  describe ".healthcheck" do
    it "has a healthcheck method that returns a string" do
      healthcheck = MlbRb.healthcheck

      expect(healthcheck).to eq("Yup, everything is fine")
    end
  end

  describe ".games_for_date" do
    let(:file) { File.read("./spec/fixtures/api_v1_schedule_2022-03-23.json") }
    it "gets the games for a specific date" do
      expect(Net::HTTP).to receive(:get)
        .with("statsapi.mlb.com", "/api/v1/schedule/games/?sportId=1&date=03/23/2022")
        .and_return(file)

      games = MlbRb.games_for_date(year: 2022, month: 3, day: 23)

      expect(games.length).to eq(14)

      first_game = games.first
      expect(first_game.game_pk).to eq(706964)
      expect(first_game.home_team.name).to eq("Detroit Tigers")
      expect(first_game.away_team.name).to eq("Pittsburgh Pirates")
      expect(first_game.home_score).to eq(6)
      expect(first_game.away_score).to eq(6)
      expect(first_game.game_date).to eq(Date.new(2022, 0o3, 23))
    end
  end
end
