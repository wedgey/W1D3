ROMAN_DICT = {
	'1': 'I',
	'5': 'V',
	'10': 'X',
	'50': 'L',
	'100': 'C',
	'500': 'D',
	'1000': 'M'
}

def traditional_to_roman(num)
	result = ""
	ROMAN_DICT.to_a.reverse.to_h.each do |key, value|
		(num / key.to_s.to_i).times do 
			result << ROMAN_DICT[key]
		end
		num %= key.to_s.to_i
	end
	result
end

require 'pry-byebug'

def to_roman(num)
	result = ""
	indices = ROMAN_DICT.keys.reverse
	while num > 0
		flag = false
		wrk_dgt = num.to_s[0].ljust(num.to_s.length,'0').to_i
		ROMAN_DICT.to_a.reverse.to_h.each do |key, value|
			indices.each do |val|

				if (key.to_s.to_i - val.to_s.to_i) == wrk_dgt
					result << ROMAN_DICT[val] << value
					num -= wrk_dgt
					flag = true
					break
				end
			end

			break if flag
			
			if not(flag) && (num / key.to_s.to_i) >= 1
				(num / key.to_s.to_i).times do
					result << value
				end
				num %= key.to_s.to_i
				break
			end
		end
	end
	result
end
 
# Drive code... this should print out trues.
 
puts to_roman(1) == "I"
puts to_roman(3) == "III"
puts to_roman(6) == "VI"

#binding.pry
puts to_roman(444)
 
# TODO: what other cases could you add to ensure your to_roman method is working?