require_relative "errors"
require_relative "client"
require_relative "game"

module MlbRb
  class Games
    class << self
      def games_for_date(options)
        date = options[:date]
        raise DateError unless validate_date(date)

        client.get_games_for_date(format_date(date))
      end

      def games_for_date_range(options)
        start_date = options[:start_date]
        end_date = options[:end_date]
        [start_date, end_date].each do |date|
          raise DateError unless validate_date(date)
        end
        client.get_games_for_range(format_date(start_date), format_date(end_date))
      end

      private

      def format_date(date)
        "#{"%02d" % date[:month]}/#{"%02d" % date[:day]}/#{date[:year]}"
      end

      def validate_date(date)
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
end
