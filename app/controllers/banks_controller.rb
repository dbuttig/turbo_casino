class BanksController < ApplicationController
  def show
    @funds = session[:funds] ||= 10
    @player_bank = session[:player_bank] ||= 0
  end

  def cash_out
    session[:player_bank] += session[:funds].to_i
    session[:funds] = 0

    @funds = session[:funds]
    @player_bank = session[:player_bank]
    
    respond_to do |format|
      format.turbo_stream { render :show }
      format.html { redirect_to banks_path }
    end
  end

  def deposit
    session[:funds] += 10
    session[:player_bank] -= 10
    @funds = session[:funds]
    @player_bank = session[:player_bank]
    
    respond_to do |format|
      format.turbo_stream { render :show }
      format.html { redirect_to banks_path }
    end
  end
end
