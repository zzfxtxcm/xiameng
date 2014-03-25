module NewHomesHelper

  def new_homes_dropdown(items)
    result = []
    items.map do |item|
      result << [PinYin.of_string(item.name)[0][0].upcase.to_s + " - " + item.name, item.id]
    end
    result.sort
  end

end
