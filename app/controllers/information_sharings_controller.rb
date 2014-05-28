class InformationSharingsController < ApplicationController
  def index
  end

  def show
    @information_sharings = InformationSharing.find(params[:id])
  end
end
