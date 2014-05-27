ActiveAdmin.register InformationSharing do


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

  menu :label => proc{ I18n.t("active_admin.information_sharing.menu.information_sharing") }

  permit_params [:title, :url, :content, :information_sharing_thumb]

  index :title => proc{ I18n.t("active_admin.information_sharing.title") } do
    selectable_column
    id_column
    column I18n.t("active_admin.information_sharing.list.title"), :title
    column I18n.t("active_admin.information_sharing.list.url"), :url
    column I18n.t("active_admin.information_sharing.list.content"), :content
    column I18n.t("active_admin.information_sharing.list.information_sharing_thumb"), :information_sharing_thumb
    actions
  end

  filter :title, :label => I18n.t("标题")
  filter :url, :label => I18n.t("链接")
  filter :content, :label => I18n.t("资料说明")
  filter :information_sharing_thumb, :label => I18n.t("缩略图")

  form do |f|
    f.inputs "" do
      f.input :title,
              :label => I18n.t("标题")
      f.input :url,
              :label => I18n.t("链接")
      f.input :content,
              :label => I18n.t("资料说明")
      f.input :information_sharing_thumb,
              :label => I18n.t("缩略图")
    end
    f.actions
  end

  controller do
    def permitted_params
      params.permit(:information_sharing => [:title,
                                             :url,
                                             :content,
                                             :information_sharing_thumb])
    end
  end

end
