class LookcharController < ApplicationController
  before_action :authenticate_user!
  def input; end

  def output
    @nick = params[:nick]
    @result = if !@nick || @nick.empty?
                @result = nil
              else
                show_char(@nick)
              end
    respond_to do |format|
      format.js { render 'output.js.erb' }
    end
  end

  private

  def show_char(nick)
    Char.where('nick LIKE ?', nick)
  end

end
