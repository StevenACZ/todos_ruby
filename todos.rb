@id = 0
@todos = [
  {id: (@id = @id.next), content: "Fill the weekly feedbac", completed: false},
  {id: (@id = @id.next), content: "Complete Ruby Basics 1", completed: false},
  {id: (@id = @id.next), content: "Complete Ruby Basics 2", completed: false},
  {id: (@id = @id.next), content: "Complete Ruby Methods", completed: false},
  {id: (@id = @id.next), content: "Do meditation", completed: false},
]

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

def list_todos
  @todos.each do |todo| 
    !todo[:completed] && puts("#{todo[:id]}. #{todo[:content]}") 
  end
end

def list_completed
end

def toggle(id)
end

def delete(id)
end

until
  puts("------------------------Welcome to toDOS------------------------\n\n")
  list_todos
  puts("\n----------------------------------------------------------------")
  puts("add | list | completed | toggle | delete\n\n")
  print("action: ")
  action = gets.to_s.strip

  case action
  when "add"
    add_todo
  when "exit"
    puts("Bye!")
    break
  end
end