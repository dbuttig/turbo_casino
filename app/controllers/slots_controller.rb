class SlotsController < ApplicationController
  before_action :set_funds

  def show
    @slots ||= ["🍋", "🍊", "🍉"]
    @message ||= "Try your luck! Cost to roll is 1 credit!"
    @funds = session[:funds]
  end

  def spin
    symbols = ["🍒", "🍋", "🍉", "🍊"]

    @funds -= 1

    @slots = 3.times.map { symbols.sample }

    win_condition = @slots.uniq.length == 1

    if win_condition && @funds > 40 && reroll(30)
      puts "Rerolling because I cheat 30..."
      @slots = 3.times.map { symbols.sample }
      win_condition = @slots.uniq.length == 1
    elsif win_condition && @funds > 60 && reroll(60)
      puts "Rerolling because I cheat 60..."
      @slots = 3.times.map { symbols.sample }
      win_condition = @slots.uniq.length == 1
    end

    if win_condition
      case @slots.first
      when "🍋"
        winnings = 10
      when "🍊"
        winnings = 20
      when "🍉"
        winnings = 30
      when "🍒"
        winnings = 40
      end

      @funds += winnings
      @message = "🎉 Jackpot! You won #{winnings}!"
    else
      @message = "Bad luck, try again!."
    end

    session[:funds] = @funds

    respond_to do |format|
      format.turbo_stream { render :show }
      format.html { redirect_to slots_path }
    end
  end

  private

  def reroll(chance)
    puts "Rerolling"
    rand(100) < chance
  end

  def set_funds
    session[:funds] ||= 10
    @funds = session[:funds]
  end
end
