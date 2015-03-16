
# example 1
# does the character appear in the string
# if so then it returns the index where the pattern exists
# the return result is truthy
def example1
    if "powerball" =~ /b/
        puts "We have a match"
    end
    p "powerball" =~ /z/
end
#example1


# match method
# the match method returns a MatchData object
def has_a_b?(string)
  if /b/.match(string)
    puts "We have a match!"
  else
    puts "No match here."
  end
end
def example2
    has_a_b?("basketball")
    has_a_b?("football")
    has_a_b?("hockey")
    has_a_b?("golf")
end
example2
