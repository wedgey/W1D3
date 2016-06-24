@states = {
  OR: 'Oregon',
  FL: 'Florida',
  CA: 'California',
  NY: 'New York',
  MI: 'Michigan',
  TT: 'Stuff'
}

@states[:AL] = 'Alabama'
@states[:CT] = 'Connecticut'

@cities = {
	OR: ['Salem', 'Portland'],
	FL: ['Tallahasse', 'Jacksonville'],
	CA: ['Los Angeles', 'Sacramento'],
	NY: ['Albany', 'New York'],
	MI: ['Lansing', 'Detroit'],
	AL: ['Montgomery', 'Birmingham'],
	CT: ['Hartford', 'Bridgeport']
}

@state_cities = {
	OR: { state: 'Oregon', cities: ['Salem', 'Portland'] },
	FL: { state: 'Flordia', cities: ['Tallahasse', 'Jacksonville'] },
	CA: { state: 'California', cities: ['Los Angeles', 'Sacramento'] },
	NY: { state: 'New York', cities: ['Albany', 'New York'] },
	MI: { state: 'Michigan', cities: ['Lansing', 'Detroit'] },
	AL: { state: 'Alabama', cities: ['Montgomery', 'Birmingham'] },
	CT: { state: 'Connecticut', cities: ['Hartford', 'Bridgeport'] },
	TT: {}
}

@taxes = {
	OR: 9.1,
  FL: 6.3,
  CA: 8.2,
  NY: 6.7,
  MI: 10.1,
  AL: 5.5,
  CT: 6.5
}

def describe_state(state_code)
	state_code = state_code.to_sym
	if @states.has_key?(state_code) && @cities.has_key?(state_code)
		"#{state_code} is for #{@states[state_code]}. It has #{@cities[state_code].count} major cities: #{@cities[state_code] * ', '}"
	elsif @states.has_key?(state_code)
		"#{state_code} is for #{@states[state_code]}. It has no cities in the database."
	elsif @cities.has_key?(state_code)
		"It has two cities but no state??"
	else
		"State code not in database."
	end
end

def calculate_tax(state_code, amount)
	state_code = state_code.to_sym
	@taxes.has_key?(state_code) ? (@taxes[state_code] * amount).round(2) : "No such state found!"
	# Force to two decimal points
	# ((@taxes[state_code.to_sym] * amount).round(2) * 100).to_i.to_s.insert(-3, '.')
	#	(@taxes[state_code] * amount).round(2)
end

def find_state_for_city(city)
	@cities.each do |key, val|
		(return key) if val.include?(city)
	end
	return "Not found."
end

def refactored_describe_state(state_code)
	state_code = state_code.to_sym
	result = ""
	if @state_cities.has_key?(state_code)
		result = @state_cities[state_code][:state] != nil ? "#{state_code} is for #{@state_cities[state_code][:state]}." : "It has no state."
		result += " It has #{@state_cities[state_code][:cities].count} major cities: #{@state_cities[state_code][:cities] * ', '}" unless @state_cities[state_code][:cities] == nil
	else
		result = "State code not in database."
	end
	result
end

def refactored_find_state_for_city(city)
	@state_cities.each do |key, val|
		(return key) if (val[:cities] != nil and val[:cities].include?(city))
	end
	return "Not found."
end

# Test drivers
puts refactored_describe_state("OR")
p calculate_tax("OR", 22.23)
puts "Albany is in #{refactored_find_state_for_city('Albany')}!"