def count_letters(string)
	count = Hash.new(0)
	string.strip.gsub(/\s/, '').each_char { |c| count[:"#{c}"] += 1}
	count
end

def letter_indices(string)
	count = Hash.new { |hash, key| hash[key] = [] }
	string.strip.gsub(/\s/, '').chars.each_with_index { |val, i| count[:"#{val}"] << i }
	count
end

puts "Counts of letters"
p count_letters("lighthouse in the house...")
puts "-----------------------------------"
puts "Indices of letters"
p letter_indices("lighthouse in the house...")