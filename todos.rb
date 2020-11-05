@id = 0
@todos = [
  {id: (@id = @id.next), content: "Fill the weekly feedbac", completed: false},
  {id: (@id = @id.next), content: "Complete Ruby Basics 1", completed: false},
  {id: (@id = @id.next), content: "Complete Ruby Basics 2", completed: false},
  {id: (@id = @id.next), content: "Complete Ruby Methods", completed: true},
  {id: (@id = @id.next), content: "Do meditation", completed: false},
]

# Add todo
def add_todo
  new_todo = {}

  until
    print("Content: ")
    content = gets.chomp

    content.empty? ? puts("Content cannot be empty") : break
  end

  new_todo = {id: (@id = @id.next), content: content, completed: false}
  @todos.push(new_todo)
end

# List todos
def list_todos
  @todos.each do |todo| 
    !todo[:completed] && puts("#{todo[:id]}. #{todo[:content]}") 
  end
end

# List completed
def list_completed
  @todos.each do |todo| 
    todo[:completed] && puts("#{todo[:id]}. #{todo[:content]}") 
  end
end

# Toggle
def toggle(ids)
  ids.each do |id|
    found_todo = @todos.find { |todo| todo[:id] == id.to_i }
    found_todo[:completed] = !found_todo[:completed]
  end
end

# Delete
def delete(ids)
  ids.each do |id|
    @todos.filter! { |todo| todo[:id] != id.to_i }
  end
end

# Welcome
def welcome
  puts("------------------------Welcome to toDOS------------------------\n\n")
  list_todos
  puts("\n----------------------------------------------------------------")
  puts("add | list | completed | toggle | delete\n\n")
  print("action: ")
end

# Next step
def next_step
  puts("----------------------------------------------------------------")
  puts("add | list | completed | toggle | delete\n\n")
  print("action: ")
end

n_loop = 0
until
  n_loop.zero? ? welcome : next_step
  action = gets.to_s.strip

  case action
  when "add"
    add_todo
  when "list"
    puts("------------------------Welcome to toDOS------------------------\n\n")
    list_todos
    puts("")
  when "toggle"
    print("todo ID(s): ")
    ids = gets.chomp.split(",")
    toggle(ids)
  when "completed"
    puts("------------------------Welcome to toDOS------------------------\n\n")
    list_completed
    puts("")
  when "delete"
    print("todo ID(s): ")
    ids = gets.chomp.split(",")
    delete(ids)
  when "exit"
    puts("Bye!")
    break
  else
    puts("Invalid action")
  end
  n_loop += 1
end