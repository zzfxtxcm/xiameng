namespace :db do
  desc "Fill database with maifang data"
  task populate: :environment do
    make_categories
    make_areas
    make_sections
    make_developers
    make_construction_categories
    make_property_types
    make_statuses
    make_area_ranges
    make_project_features
    make_new_homes
    make_information_type_id
    make_information
  end

  def make_categories
    # 信息分类
    Category.create!(name: "房产咨询")
  end

  def make_areas
    # 区域
    Area.create!(name: "芗城区")
  end

  def make_sections
    # 版块
    Section.create!(name: "城中")
  end

  def make_developers
    # 开发商
    Developers.create!(name: "万达")
  end

  def make_construction_categories
    # 建筑类型
    ConstructionCategory.create!(name: "超高层")
  end

  def make_property_types
    # 物业类型
    PropertyType.create!(name: "城市综合体")
  end

  def make_statuses
    # 状态
    Status.create!(name: "优惠")
  end

  def make_area_ranges
    # 面积区间
    AreaRange.create!(name: "0-50")
  end

  def make_project_features
    ProjectFeatures.create!(name: "高档社区")
  end

  def make_new_homes
    NewHome.create!(name: "万达房产",
                    price: 8000,
                    tel: "0596-8888888",
                    project_address: "碧湖万达",
                    sales_address: "售楼地址",
                    area_id: Area.first.id,
                    section_id: Section.first.id,
                    developers_id: Developers.first.id,
                    agents: "代理商",
                    covers: "1000亩",
                    gfa: "800亩",
                    pool_area: "20平方",
                    parking: "很多",
                    number_users: "10000",
                    construction_category_id: ConstructionCategory.first.id,
                    building_towers: "18",
                    floors_case: "30",
                    main_units: "小户型",
                    house_area: "80平方米",
                    area_range_id: AreaRange.first.id,
                    greening_rate: "30%",
                    volume_rate: "82%",
                    fit: "简修",
                    property: "70年",
                    school: "巷口小学",
                    hospital: "中医院",
                    bank: "建行",
                    shopping: "沃尔玛",
                    neighborhoods: "无",
                    landscapes: "无",
                    bus: "27",
                    car: "自驾",
                    property_type_id: PropertyType.first.id,
                    project_features_id: ProjectFeatures.first.id,
                    content: "内容内容内容内容内容",
                    status_id: Status.first.id,
                    new_home_thumb: "")
    10.times do |n|
      name = Faker::Name.title
      price = 1000 * n;
      project_address = Faker::Address.street_address
      NewHome.create!(name: name,
                      price: price,
                      tel: "0596-8888888",
                      project_address: project_address,
                      sales_address: "售楼地址",
                      area_id: Area.first.id,
                      section_id: Section.first.id,
                      developers_id: Developers.first.id,
                      agents: "代理商",
                      covers: "1000亩",
                      gfa: "800亩",
                      pool_area: "20平方",
                      parking: "很多",
                      number_users: "10000",
                      construction_category_id: ConstructionCategory.first.id,
                      building_towers: "18",
                      floors_case: "30",
                      main_units: "小户型",
                      house_area: "80平方米",
                      area_range_id: AreaRange.first.id,
                      greening_rate: "30%",
                      volume_rate: "82%",
                      fit: "简修",
                      property: "70年",
                      school: "巷口小学",
                      hospital: "中医院",
                      bank: "建行",
                      shopping: "沃尔玛",
                      neighborhoods: "无",
                      landscapes: "无",
                      bus: "27",
                      car: "自驾",
                      property_type_id: PropertyType.first.id,
                      project_features_id: ProjectFeatures.first.id,
                      content: "内容内容内容内容内容",
                      status_id: Status.first.id,
                      new_home_thumb: "")
    end
  end

  def make_information_type_id
    InformationType.create!(name: "首页头条")
    InformationType.create!(name: "新房速递")
    InformationType.create!(name: "楼盘优惠")
    InformationType.create!(name: "市场报告")
    InformationType.create!(name: "今日话题")
    InformationType.create!(name: "楼市咨询")
    InformationType.create!(name: "楼市观点")
    InformationType.create!(name: "活动")
    InformationType.create!(name: "购房须知")
    InformationType.create!(name: "购房警示")
    InformationType.create!(name: "购房指南")
  end

  def make_information
    Information.create!(category_id: Category.first.id,
                        title: "漳州楼市",
                        information_thumb: "",
                        source: "来源",
                        keywords: "关键词,关键词",
                        description: "描述描述描述描述",
                        content: "内容",
                        new_home_id: NewHome.first.id,
                        information_type_id: 1)
    new_homes = NewHome.all(limit:6)
    20.times do |n|
      title = Faker::Name.title
      content = Faker::Lorem.sentence(10)
      new_homes.each { |new_home| new_home.information.create!(category_id: Category.first.id,
                                                      title: title,
                                                      source: "来源",
                                                      keywords: "关键词,关键词",
                                                      description: "描述描述描述描述",
                                                      content: content,
                                                      information_type_id: 2)  }
    end
  end
end
