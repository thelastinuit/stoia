# frozen_string_literal: true

module StoiaExceptions
  class MissingOrder < StandardError
    def initialize
      message = 'Missing order param'
      super(message)
    end
  end
end
