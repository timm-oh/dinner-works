class HomeController < ApplicationController
  def index
    @registration = Registration.new
  end
end
