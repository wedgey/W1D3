# def char_count(list)
#   letters = Hash.new(0)
#   list.each do |word|
#     word.split('').each { |letter| letters[letter] += 1 }
#   end
#   letters
# end
def char_count(list)
	letters = Hash.new(0)
	(list * '').each_char { |c| letters[c] += 1 }
	letters
end

# Why the long face(error)? 
# 1. This should return count of each letter in the list
# ex: { "a" => 4, "p" => 3, "l" => 1  ...}

puts char_count(['apples', 'oranges', 'hipsters', 'are', 'same'])


# 2. What are the improvements you can do to above code?
# We can convert the array into one string and then count the chars from the string