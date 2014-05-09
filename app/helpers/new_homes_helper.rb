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

end
