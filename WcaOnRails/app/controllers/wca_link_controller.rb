# frozen_string_literal: true

class WcaLinkController < ActionController::BaseActionController::Base
  def redirect
    logger.info @request.path
    logger.info @request
    render :plain => @request.path
  end

  def test
    logger.info "test""
  end
end
