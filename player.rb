class Player
  def play_turn(warrior)
    @health ||= warrior.health
    @direction = warrior.direction_of_stairs
    @warrior = warrior

    if enemy?
      warrior.attack!(@direction)
    elsif taking_damage?
      warrior.walk!(@direction)
    elsif can_rest?
      warrior.rest!
    else
      warrior.walk!(@direction)
    end
    @health = warrior.health
  end

  def enemy?
    @warrior.feel(@direction).enemy?
  end

  def taking_damage?
    @warrior.health < @health
  end

  def space?
    @warrior.feel(@direction).empty?
  end

  def can_rest?
    space? && @warrior.health < 20
  end
end
