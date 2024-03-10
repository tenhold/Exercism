class BoutiqueInventory
  def initialize(items)
    @items = items
  end

  def item_names
    items.map { |item| item[:name] }&.sort
  end

  def cheap
    items.filter { |item| item[:price] < 30.0 }
  end

  def out_of_stock
    items.filter { |item| item[:quantity_by_size].empty? }
  end

  def stock_for_item(name)
    item = items.find { |item| item[:name] == name }

    item[:quantity_by_size]
  end

  def total_stock
    items.sum { |item| item[:quantity_by_size].values.sum }
  end

  private
  attr_reader :items
end
