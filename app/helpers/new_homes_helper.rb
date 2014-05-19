module NewHomesHelper

  def new_homes_dropdown(items)
    result = []

    if ActiveRecord::Base.connection.table_exists? 'new_homes'
      items.map do |item|
        result << [PinYin.of_string(item.name)[0][0].upcase.to_s + " - " + item.name, item.id]
      end
    end

    result.sort
  end

  def render_option_of_total_area(option)
    css_class_name ||= "btn btn-link"
    css_class_name = "btn btn-inverse" if option.blank?
    link_to("全部", new_homes_path(:area_id => '',
                                   :section_id => params[:section_id],
                                   :area_range_id => params[:area_range_id],
                                   :property_type_id => params[:property_type_id]),
                                   :utf8 => params[:utf8],
                    :class => "#{css_class_name}")
  end
  def render_option_of_single_area(key, value)
    css_class_name ||= "btn btn-link"
    if params[:area_id].to_i == value.to_i
      css_class_name = "btn btn-inverse"
    end
    link_to(key, new_homes_path(:area_id => value,
                                :section_id => params[:section_id],
                                :area_range_id => params[:area_range_id],
                                :property_type_id => params[:property_type_id]),
                                :utf8 => params[:utf8],
                 :class => "#{css_class_name}")
  end  
end
