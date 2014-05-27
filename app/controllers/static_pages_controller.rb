class StaticPagesController < ApplicationController
  def home
    @areas = Area.all
    @sections = Section.all
    @intention_to_register = IntentionToRegister.new
  end

  def help
  end
end
