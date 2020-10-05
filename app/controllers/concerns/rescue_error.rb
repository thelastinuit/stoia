# frozen_string_literal: true

module RescueError
  extend ActiveSupport::Concern

  included do
    rescue_from StoiaExceptions::MissingOrder do |e|
      render_error e, status: :internal_server_error
    end

    private

    def render_error(e, status: :unprocessable_entity, message: nil)
      Rails.logger.error "ERROR: #{(message || e.message)} \n BACKTRACE: #{e.backtrace}"
      render json: { errors: [{ message: e.message, backtrace: e.backtrace }], data: {} }, status: status
    end
  end
end
