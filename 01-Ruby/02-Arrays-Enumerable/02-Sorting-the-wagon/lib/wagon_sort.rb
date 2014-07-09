def wagon_sort(students)
  # TODO: return a copy of students, sorted alphabetically
  students.sort {|a, b| a.downcase <=> b.downcase}
end
