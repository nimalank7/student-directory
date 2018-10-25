#let's put all the students into an array
def input_students
  puts "Please enter the names of the students".center(100)
  puts "To finish, just hit return twice".center(100)
  # create an empty array
  students = []
  # get the first name
  name = gets.slice(0...-1)
  cohort = gets.slice(0...-1).to_sym
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: cohort}
    if students.count < 1
      puts "Now we have #{students.count} student".center(100)
    else
      puts "Now we have #{students.count} students".center(100)
    end
    # get another name from the user
    name = gets.slice(0...-1)
    cohort = gets.slice(0...-1).to_sym
  end
  # return the array of students
  students
end
def print_header
  puts "The students of Villains Academy".center(100)
  puts "-------------".center(100)
end
def print(students)
  cohort_list = []
  students.map do |student|
    contain = cohort_list.include? student[:cohort]
    if contain != true
      cohort_list << student[:cohort]
    end
  end
  cohort_list.each do |cohort_name|
    students.each do |student|
      next if student[:cohort] != cohort_name
      puts "#{student[:name]} (#{student[:cohort]} cohort)".center(100)
    end
  end
end
def print_footer(names)
  puts "Overall, we have #{names.count} great students".center(100)
end
#nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
