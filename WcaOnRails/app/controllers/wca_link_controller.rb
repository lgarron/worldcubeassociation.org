# frozen_string_literal: true

class WcaLinkController < ActionController::BaseActionController::Base
  def redirect
    render :text => @request.path
  end
end
