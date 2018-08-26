class Map
  def initialize
    @array = [[]]
  end

  def set(key, value)
    first_el = @array.find { |e| el[0] == key}
    # does not iterate over an empty array
    if first_el
      first[1] = value
      # already there, replace
    else
      @array << [key, value]
    end
  end

  def get(key)
    ans =  @array.find { |el| el[0] == key }
   ans ? el[1] : nil
  end

  def delete(key)
@array.each_index {|i| @array.delete_at(i) if @array[i][0] == key}
  end
end
