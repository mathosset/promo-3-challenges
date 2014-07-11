def array_to_hash(array)
  #TODO: implement the method :)
  hash = Hash.new

  array.each_with_index do |x, y|
    if block_given?
      hash[yield(y)] = x
    else
      hash[y] = x
    end
  end

  return hash

end