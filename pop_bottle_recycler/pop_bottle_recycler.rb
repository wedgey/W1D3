def get_input
	puts "How much would you like to spend?"
	gets.strip
end

def calc_redemption(investment)
	redemption = {
		purchased: investment / 2,
		empty_bottles: investment / 4,
		bottle_caps: investment / 8
}
end

def get_bottles(investment)
	redemption = calc_redemption(investment)

	# Detailed breakdown of redemption
	result = "\nYou will have purchased #{redemption[:purchased]}"
	result += redemption[:purchased] == 1 ? " bottle, " : " bottles, "
	result += redemption[:empty_bottles] == 1 ? "redeemed #{redemption[:empty_bottles]} bottle from empty bottles, " : "redeemed #{redemption[:empty_bottles]} bottles from empty bottles, "
	result += redemption[:bottle_caps] == 1 ? "and #{redemption[:bottle_caps]} bottle from bottle caps.\n" : "and #{redemption[:bottle_caps]} bottles from bottle caps.\n"

	# Separator
	result += "--------------------------------------------\n"

	# Total and leftover
	total = redemption.inject(0) { |sum, (k,v)| sum + v}
	result += total == 1 ? "A total of #{total} bottle with " : "A total of #{total} bottles with "
	result += redemption[:purchased] % 2 == 1 ? "#{redemption[:purchased] % 2} bottle and " : "#{redemption[:purchased] % 2} bottles and "
	result += redemption[:purchased] % 4 == 1 ? "#{redemption[:purchased] % 4} bottle cap left over.\n\n" : "#{redemption[:purchased] % 4} bottle caps left over.\n\n"
end

def main
	loop do 
		case input = get_input.downcase
		when 'exit'
			puts "We will exit now..."
			break
		when /^\d+/
			puts get_bottles(input.to_i)
		else
			puts "Please give us money, not a string..."
		end
	end
end

def main_recurse
	case input = get_input.downcase
	when 'exit'
		puts "We will exit now..."
		return
	when /^\d+/
		puts get_bottles(input.to_i)
	else
		puts "Please give us money, not a string..."
	end
	main_recurse
end


main_recurse