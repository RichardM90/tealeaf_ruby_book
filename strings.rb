

# does the sequence of characters 'lab' exist in the passed word
def exercise1(word)
  # my answer
  if word.include?("lab")
    puts word
  end
  # the answer
  if /lab/ =~ word
    puts word
  end
end
words = ["laboratory", "experiment", "Pans Labyrinth", "elaborate", "polar bear"]
words.each { |w| exercise1(w) }

