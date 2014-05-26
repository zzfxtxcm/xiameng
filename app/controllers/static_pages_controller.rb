class StaticPagesController < ApplicationController
  def home
    @areas = Area.all
    @sections = Section.all
  end

  def help
  end
end
