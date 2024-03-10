module FlattenArray
  def self.flatten(array)
    array.reduce([]) do |result, ele|
      return result if ele.nil?

      if ele.is_a?(Array)
        result + flatten(ele)
      else
        result << ele
      end
    end
  end
end
