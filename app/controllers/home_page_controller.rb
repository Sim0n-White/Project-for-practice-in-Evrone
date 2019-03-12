class HomePageController < ApplicationController
  before_action :authenticate_user!
  def input
  end

  def output
  end
end
