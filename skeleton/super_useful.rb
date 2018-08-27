# PHASE 2
def convert_to_int(str)
  Integer(str)
rescue ArgumentError
  return nil
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"

  elsif maybe_fruit == "coffee"
      raise NoCoffeeError.new
  else
    raise NoFruitError.new
  end
#   puts "Give me coffee first"
#   input = gets.chomp
#   if input == "coffee"
#     feed_me_a_fruit
#   else
#     raise NoCoffee.new("That")
# end
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"

  puts "Feed me a fruit! (Enter the name of a fruit:)"
  begin
    maybe_fruit = gets.chomp
    reaction(maybe_fruit)
  rescue NoFruitError => e
    puts e.message
  rescue NoCoffeeError => e
    puts e.message
    retry


  end
end

class NoCoffeeError < StandardError
  def message
    "Coffee?  I like coffee, try again now please!  This time for fruit..."
  end
end

class NoFruitError < StandardError
  def message
    "I only like fruit :("
  end
end

class NewFriendsError < StandardError
  def message
    "haven't been friends long enough"
  end
end

class NameError < StandardError
  def message
    "I need a name"
  end
end

class HobbyError < StandardError
  def message
    "I need hobbies"
  end
end

# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    @name = name
    @yrs_known = yrs_known
    @fav_pastime = fav_pastime
    if @yrs_known < 5
      raise NewFriendsError.new
    end
    if @name.length <= 0
      raise NameError.new
    end
    if @fav_pastime.length <= 0
      raise HobbyError.new
    end
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me."
  end
end
