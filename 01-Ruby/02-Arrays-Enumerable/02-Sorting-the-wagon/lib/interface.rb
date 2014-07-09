require_relative "wagon_sort"

students = []

begin
  puts students.empty? ? "Type a student name:" : "Type another student name (or press enter to finish):"
  name = gets
  name.chomp! if name

  # TODO: Add the name we just got to the students array
  students << name if name != ""

end while name != ""

# TODO: Call `wagon_sort` method and display the sorted student list

students = wagon_sort(students)

students_size = students.size

puts "congratulations you have #{students_size} students : "

first_part = students.first(students_size-1).join(", ")

puts "#{first_part} and #{students.last}"