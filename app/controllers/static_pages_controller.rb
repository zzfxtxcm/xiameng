class StaticPagesController < ApplicationController
  def home
    @areas = Area.all
  end

  def help
  end
end
