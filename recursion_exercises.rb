require "byebug"
def range(start, final)
    answer = []

    if start == final
        return answer
    else
        answer += [start] + range(start + 1, final)
    end

    answer
end

# p range(1,5)

def iterative_sum(array)
    sum = 0

    array.each { |ele| sum += ele}

    sum
end 

# p iterative_sum([1,2,3,4,5])

def recursive_sum(array)
    if array.empty?
        return 0
    elsif array.length == 1
        return array[0]
    else
        return array[0] + recursive_sum(array[1..-1])
    end
end

# p recursive_sum([1,2,3,4,5])

def exponent_1(b, n)
    if n == 0
        return 1
    else
        return b * exponent_1(b, n-1)
    end
end

# p exponent_1(2,4)

def exponent_2(b, n)
   if n == 1
    return b
   elsif n.even?
    return exponent_2(b, n/2) * exponent_2(b, n/2)
   else
    return exponent_2(b, (n-1) / 2) * b**2
   end
end

# p exponent_2(3,3)

def deep_dup(array)
    new_arr = []

    if new_arr.length == array.length
        return new_arr
    end

    array.each do |ele|
        if ele.is_a?(Array)
            new_arr << deep_dup(ele)
        else
            temp = ele.clone
            new_arr << temp
        end
    end

    new_arr
end 

# robot_parts = [
#     ["nuts", "bolts", "washers"],
#     ["capacitors", "resistors", "inductors"]
#   ]

# puts robot_parts[0].object_id

# clone = deep_dup(robot_parts)
# puts clone[0].object_id

def fibonacci_iter(n)
    answer = []
    first = 0
    second = 1
    third = first + second
    if n == 0
        return []
    elsif n ==1
        return answer << first
    elsif n ==2
        return [0, 1]
    end
    answer = [0, 1]
    (n-2).times do
        answer << third
        first = second
        second = third
        third = first + second
    end
    answer
end

def fibonacci_rec(n)
   answer = []

   if n == 0
    return answer
   elsif n == 1
    return [0]
   elsif n == 2
    return [0,1]
   end

   temp = fibonacci_rec(n-1)
   temp << temp[-1] + temp[-2]
end

# p fibonacci_rec(4)

def binary_search(array, target)
    middle = array.length / 2
    
    if array.length == 0
        return nil
    elsif target == array[middle]
        return middle
    elsif target < array[middle]
        binary_search(array[0...middle], target)
    elsif target > array[middle]
        if binary_search(array[middle+1..-1], target) == nil
            return nil
        else
            middle + 1 + binary_search(array[middle+1..-1], target)
        end
    end
end

# p binary_search([1, 2, 3, 4, 5, 6], 7)

def merge(arr_left, arr_right)
    total = arr_left.length + arr_right.length
    merged_arr = []
    
    left = 0
    right = 0

    
    while left < arr_left.length && right < arr_right.length
        if arr_left[left] < arr_right[right]
            merged_arr << arr_left[left]
            left += 1
        else
            merged_arr << arr_right[right]
            right += 1
        end
    end

    if right > left
        merged_arr += arr_left[left..-1]
    elsif left > right
        merged_arr += arr_right[right..-1]
    end

    merged_arr
end

def merge_sort(unsorted_arr)
    #base case
    if unsorted_arr.length <= 1
        return unsorted_arr
    end

    middle = unsorted_arr.length / 2

    left_arr = unsorted_arr[0...middle]
    right_arr = unsorted_arr[middle..-1]


    return merge(merge_sort(left_arr), merge_sort(right_arr))
end

p merge_sort([10,-1,2,5,0,6,4,-5])


