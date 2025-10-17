class CasinoController < ApplicationController
  def index
    session[:funds] ||= 10
    session[:player_bank] ||= 0
  end
end
