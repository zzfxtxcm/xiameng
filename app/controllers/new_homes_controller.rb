class NewHomesController < ApplicationController
  def index
    @new_homes = NewHome.order('created_at DESC')
                        .paginate(page: params[:page])
                        .per_page(5)
  end

  def show
    @new_home = NewHome.find(params[:id])
  end
end
