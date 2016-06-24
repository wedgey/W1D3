def sum(list)
	sum =0
  list.each do |ele|
    sum += ele
  end
  sum
end

def sum(list)
	list.inject { |sum, ele| sum + ele }
end

list1 = [16,21,31,42,55]

# 1. The following should return 165 instead of an error
puts sum(list1)

# 2. How would you refactor it using an enumerable method other than each? Examples of enumerables: map, select, inject, reject, detect.
def sum_refactored(list)
	list.inject { |sum, ele| sum + ele }
end