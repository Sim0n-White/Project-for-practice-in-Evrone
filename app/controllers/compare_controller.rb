class CompareController < ApplicationController
  before_action :authenticate_user!
  def input; end

  def output
    @name = params[:name]
    @nick_co = params[:nick_co]
    @name_co = params[:name_co]
    if (!@name_co || @name_co.empty?) && (!@nick_co || @nick_co.empty?) && (!@name || @name.empty?)
      @result_co = nil
      @result = nil
    else
      @result = abbilities(@name)
      @sum_res = 0
      @sum_res_co = 0
      @result.each do |char|
        @sum_res = char.strength.to_i + char.perception.to_i + char.endurance.to_i + char.charisma.to_i + char.intelligence.to_i + char.agility.to_i + char.luck.to_i
      end
      @result_co = abbilities_co(@nick_co, @name_co)
      @result_co.each do |char|
        @sum_res_co = char.strength.to_i + char.perception.to_i + char.endurance.to_i + char.charisma.to_i + char.intelligence.to_i + char.agility.to_i + char.luck.to_i
      end
    end

    respond_to do |format|
      format.js { render 'output.js.erb' }
    end
  end

  private

  def abbilities(name)
    Char.where('nick LIKE ? and name LIKE ?', current_user.nickname, name)
  end

  def abbilities_co(nick, name)
    Char.where('nick LIKE ? and name LIKE ?', nick, name)
  end
end
