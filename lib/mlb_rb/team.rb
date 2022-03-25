# frozen_string_literal: true

module MlbRb
  class Team
    attr_reader :id, :name
    def initialize(team_hash)
      @id = team_hash["id"]
      @name = team_hash["name"]
    end
  end
end
