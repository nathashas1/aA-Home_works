def quadratic_search(fishes)
  fishes.each_with_index do |fish1,i|
    max_length = true
      fishes.each_with_index do |fish2,j|
        next if i == j
        if fish2.length > fish1.length
          max_length = false
        end
      end
      return fish1 if max_length
    end
end

class Array
  def merge_sort(&prc)
    prc ||= Proc.new{ |x,y| x.length <=> y.length }
  return self if self.length <= 1
  mid = self.length/2
  left = self.dup[0...mid].merge_sort(&prc)
  right = self.dup[mid..-1].merge_sort(&prc)
  Array.merge(left,right,&prc)
  end


  private

  def self.merge(left,right,&prc)
    prc ||= Proc.new{ |x,y| x.length <=> y.length }
    result = []
    until left.empty? || right.empty?
    ans = prc.call(left,right)
      if ans == 1
        result << right.shift
      else
        result << left.shift
      end
    end
    result + left + right
  end
end


def dominant_octopus(fishes)
  prc = Proc.new { |x,y| y.length<=>x.length }
  fishes.merge_sort(&prc)[0]
end

def clever_octopus(fishes)
  large_fish = fishes[0]
  fishes[1..-1].each do |fish|
    if fish.length > large_fish.length
      large_fish = fish
    end
  end
  large_fish
end


def slow_dance(direction,tiles_array)
   tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
   tiles_array.each_with_index do |tile,index|
     return index if tile == direction
    end
end

tiles_hash = {
    "up" => 0,
    "right-up" => 1,
    "right"=> 2,
    "right-down" => 3,
    "down" => 4,
    "left-down" => 5,
    "left" => 6,
    "left-up" => 7
}

def fast_dance(direction, tiles_hash)
  tiles_hash[direction]
end
