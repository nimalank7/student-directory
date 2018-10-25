#let's put all the students into an array
def input_students
  puts "Please enter the names of the students and their hobbies".center(100)
  puts "To finish, just hit return twice".center(100)
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  cohort = gets.chomp.to_sym
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: cohort}
    puts "Now we have #{students.count} students".center(100)
    # get another name from the user
    name = gets.chomp
    cohort = gets.chomp.to_sym
  end
  # return the array of students
  students
end
def print_header
  puts "The students of Villains Academy".center(100)
  puts "-------------".center(100)
end
def print(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)".center(100)
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
