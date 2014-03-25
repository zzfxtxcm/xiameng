ActiveAdmin.register NewHome do


  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end

  menu :label => proc{ I18n.t("active_admin.new_homes.menu.new_home") }

  action_item do
    link_to "区域管理", "/admin/areas"
  end

  action_item do
    link_to "版块管理", "/admin/sections"
  end

  action_item do
    link_to "开发商管理", "/admin/developers"
  end

  action_item do
    link_to "开盘信息管理", "/admin/information_estate_openeds"
  end

  permit_params [:name]

  index :title => proc{ I18n.t("active_admin.new_homes.title") } do
    selectable_column
    id_column
    column I18n.t("active_admin.new_homes.list.name"), :name
    actions
  end

  filter :status, :label => I18n.t("active_admin.new_homes.search.status")
  filter :area, :label => I18n.t("active_admin.new_homes.search.area")
  filter :developers, :label => I18n.t("active_admin.new_homes.search.developers")
  filter :name, :label => I18n.t("active_admin.new_homes.search.name")
  filter :price, :label => I18n.t("active_admin.new_homes.search.price")
  filter :created_at,
         :label => I18n.t("active_admin.new_homes.search.created_at")

  form do |f|
    f.inputs "" do
      f.input :name,
              :label => I18n.t("active_admin.new_homes.form.name")
      f.input :price,
              :label => I18n.t("active_admin.new_homes.form.price")
      f.input :tel,
              :label => I18n.t("active_admin.new_homes.form.tel")
      f.input :project_address,
              :label => I18n.t("active_admin.new_homes.form.project_address")
      f.input :sales_address,
              :label => I18n.t("active_admin.new_homes.form.sales_address")
      f.input :area,
              :prompt => true,
              :label => I18n.t("active_admin.new_homes.form.area")
      f.input :section,
              :prompt => true,
              :label => I18n.t("active_admin.new_homes.form.section")
      f.input :developers,
              :prompt => true,
              :label => I18n.t("active_admin.new_homes.form.developers")
      f.input :agents,
              :label => I18n.t("active_admin.new_homes.form.agents")
      f.input :covers,
              :label => I18n.t("active_admin.new_homes.form.covers")
      f.input :gfa,
              :label => I18n.t("active_admin.new_homes.form.gfa")
      f.input :pool_area,
              :label => I18n.t("active_admin.new_homes.form.pool_area")
      f.input :parking,
              :label => I18n.t("active_admin.new_homes.form.parking")
      f.input :number_users,
              :label => I18n.t("active_admin.new_homes.form.number_users")
      f.input :construction_category,
              :prompt => true,
              :label => I18n.t("active_admin.new_homes.form.construction_category")
      f.input :building_towers,
              :label => I18n.t("active_admin.new_homes.form.building_towers")
      f.input :floors_case,
              :label => I18n.t("active_admin.new_homes.form.floors_case")
      f.input :main_units,
              :label => I18n.t("active_admin.new_homes.form.main_units")
      f.input :house_area,
              :label => I18n.t("active_admin.new_homes.form.house_area")
      f.input :area_range,
              :prompt => true,
              :hint => f.template.content_tag(:span, "平方米"),
              :label => I18n.t("active_admin.new_homes.form.area_range")
      f.input :greening_rate,
              :label => I18n.t("active_admin.new_homes.form.greening_rate")
      f.input :volume_rate,
              :label => I18n.t("active_admin.new_homes.form.volume_rate")
      f.input :fit,
              :label => I18n.t("active_admin.new_homes.form.fit")
      f.input :property,
              :label => I18n.t("active_admin.new_homes.form.property")
      f.input :school,
              :label => I18n.t("active_admin.new_homes.form.school")
      f.input :hospital,
              :label => I18n.t("active_admin.new_homes.form.hospital")
      f.input :bank,
              :label => I18n.t("active_admin.new_homes.form.bank")
      f.input :shopping,
              :label => I18n.t("active_admin.new_homes.form.shopping")
      f.input :neighborhoods,
              :label => I18n.t("active_admin.new_homes.form.neighborhoods")
      f.input :landscapes,
              :label => I18n.t("active_admin.new_homes.form.landscapes")
      f.input :bus,
              :label => I18n.t("active_admin.new_homes.form.bus")
      f.input :car,
              :label => I18n.t("active_admin.new_homes.form.car")
      f.input :property_type,
              :prompt => true,
              :label => I18n.t("active_admin.new_homes.form.property_type")
      f.input :project_features,
              :prompt => true,
              :label => I18n.t("active_admin.new_homes.form.project_features")
      f.input :content,
              :label => I18n.t("active_admin.new_homes.form.content"),
              :as => :ckeditor
      f.input :status,
              :prompt => true,
              :label => I18n.t("active_admin.new_homes.form.status")
      f.input :new_home_thumb,
              :hint => f.object.new_home_thumb.present? \
                       ? f.template.image_tag(f.object.new_home_thumb.url(:thumb))
                       : f.template.content_tag(:span, "未传图片"),
              :label => I18n.t("active_admin.new_homes.form.new_home_thumb")
      f.input :new_home_thumb_cache, :as => :hidden
    end
    f.actions
  end

  controller do
    def permitted_params
      params.permit(:new_home => [:name,
                                  :price,
                                  :tel,
                                  :project_address,
                                  :sales_address,
                                  :area_id,
                                  :section_id,
                                  :developers_id,
                                  :agents,
                                  :covers,
                                  :gfa,
                                  :pool_area,
                                  :parking,
                                  :number_users,
                                  :construction_category_id,
                                  :building_towers,
                                  :floors_case,
                                  :main_units,
                                  :house_area,
                                  :area_range_id,
                                  :greening_rate,
                                  :volume_rate,
                                  :fit,
                                  :property,
                                  :school,
                                  :hospital,
                                  :bank,
                                  :shopping,
                                  :neighborhoods,
                                  :landscapes,
                                  :bus,
                                  :car,
                                  :property_type_id,
                                  :content,
                                  :status_id,
                                  :new_home_thumb])
    end
  end
end
