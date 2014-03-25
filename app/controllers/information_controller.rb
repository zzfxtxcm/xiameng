class InformationController < ApplicationController
  def index
    @information = Information.order('created_at DESC')
                              .paginate(page: params[:page])
                              .per_page(10)
    @information.total_entries = 1000 if(@information.total_entries > 1000)
  end

  def show
    @information = Information.find(params[:id])
  end
end
