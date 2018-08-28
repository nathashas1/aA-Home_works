require_relative 'mancala.rb'
require_relative 'player.rb'
class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @player_1 = name1
    @player_2 = name2
    @current_player
    @cups = Array.new(14){Array.new}
    place_stones
  end


    def place_stones
      # helper method to #initialize every non-store cup with four stones each
      @cups.each_with_index do |cup,i|
        if i == 6 || i== 13
          cup =[]
          next
        end
        4.times { cup << :stone}
      end
    end


  def valid_move?(start_pos)
    if start_pos > @cups.length-1
    raise 'Invalid starting cup'
    end
    if @cups[start_pos].empty?
    raise 'Starting cup is empty'
    end
  end

  def make_move(start_pos, current_player_name)
    @current_player = current_player_name
    i = 0
      if @player_1 == current_player_name
        i=1
        until self.cups[start_pos].empty?
            if (start_pos+i) % 14 == 13
            i+=1
              next
            end
          stone_pop = self.cups[start_pos].pop
          self.cups[(start_pos+i)% 14] << stone_pop
          i+=1
        end
      else
        i=1
        until self.cups[start_pos].empty?
            if (start_pos+i) % 14 == 6
            i+=1
              next
            end
          stone_pop = self.cups[start_pos].pop
          self.cups[(start_pos+i)% 14] << stone_pop
          i+=1
        end
      end
      self.render
      self.next_turn((start_pos + i - 1) % 14)

    end

  def next_turn(ending_cup_idx)
    if (@current_player == @player_1  && ending_cup_idx == 6)
      return :prompt
    end
    if (@current_player == @player_2  && ending_cup_idx == 13)
      return :prompt
    end


    if self.cups[ending_cup_idx].length == 1
      return :switch

    else
    ending_cup_idx
    end

    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    return true if self.cups[0..5].all? { |cup| cup.empty? }
    return true if self.cups[7..12].all? { |cup| cup.empty? }
    false
  end

  def winner
    player_1_points = self.cups[6].length
    player_2_points = self.cups[13].length
    if player_1_points > player_2_points
      @player_1
    elsif player_2_points > player_1_points
      @player_2
    else
      :draw
    end
  end
end
