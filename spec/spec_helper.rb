# frozen_string_literal: true

require "mlb_rb"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

def deeply_stringify_keys(hash)
  stringified_hash = {}
  hash.each do |k, v|
    stringified_hash[k.to_s] = if v.is_a?(Hash)
      deeply_stringify_keys(v)
    elsif v.is_a?(Array)
      v.map { |i| i.is_a?(Hash) ? deeply_stringify_keys(i) : i }
    else
      v
    end
  end
  stringified_hash
end
