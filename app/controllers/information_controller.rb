class InformationController < ApplicationController
  add_breadcrumb "馨窝网首页", :root_path
  add_breadcrumb "咨询", :information_index_path

  def index
    @information = Information.order('created_at DESC')
                              .paginate(page: params[:page])
                              .per_page(10)
    @information.total_entries = 1000 if(@information.total_entries > 1000)

    case params[:search_type]
    when "news"
      redirect_to URI.escape("http://#{params[:station]}.xinwowang.com/information?keyword=#{params[:keyword]}")
    when "new_homes"
      redirect_to URI.escape("http://#{params[:station]}.xinwowang.com/new_homes?keyword=#{params[:keyword]}")
    else
      @keyword = Sunspot.search(Information) do
        per_page = params[:per_page]
        if per_page.blank?
          per_page = 10
        else
          per_page = params[:per_page]
        end
        keywords params[:keyword]
        with(:information_type_id).equal_to(params[:information_type_id]) if params[:information_type_id].present?
        with(:category_id).equal_to(params[:category_id]) if params[:category_id].present?
        order_by :created_at, :desc
        paginate :page => params[:page], :per_page => per_page
      end

      @information = @keyword.results

      respond_to do |format|
        format.html
        format.json { render json: @information }
        format.js
      end

    end
  end

  def show
    @information = Information.find(params[:id])

    add_breadcrumb "正文", information_path
  end
end
