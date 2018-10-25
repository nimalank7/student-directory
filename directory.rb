def interactive_menu

loop do
  # 1. Print the menu and ask the user what to do
  # 2. read the input and save it into a variable
  # 3. Do what the user has asked
  print_menu
  process(STDIN.gets.chomp)
end
end

#let's put all the students into an array
def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit" # 9 because we'll be adding more items
end
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array

  # get the first name
  name = STDIN.gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    @students << {name: name, cohort: :november}
    puts "Now we have #{@students.count} students"
    # get another name from the user
    name = STDIN.gets.chomp
  end
  # return the array of students
  @students
end
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end
def print_students_list(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end
def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end
def show_students
  print_header
  print_students_list(@students)
  print_footer(@students)
end
def save_students(filename = "students.csv")
  # open the file for writing
  file = File.open(filename, "w")
  # iterate over the array of save_students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end
def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(",")
    @students = []
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end
def try_load_students
  filename = ARGV.first # first argument from the command line
  return if filename.nil? # get out of the method if it isn't given
  if File.exists?(filename) # if it exists
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end

#nothing happens until we call the methods
def process(selection)
  case selection
  when "1"
    @students = input_students
  when "3"
    puts "Enter the filename:"
    filename = STDIN.gets.chomp
    save_students(filename)
    puts "Students saved!"
  when "2"
    show_students
    puts "Displayed students completed"
  when "4"
    puts "Enter the filename"
    filename = STDIN.gets.chomp
    load_students(filename)
    puts "Loading students from file"
  when "9"
    puts "Closing down program..."

    exit # this will cause the program to terminate
  else
    puts "i don't know what you meant, try again"
  end
end

try_load_students
interactive_menu
