# frozen_string_literal: true

class WcaLinkController < ApplicationController
  def redirect
    render :text => @request.path
  end
end
