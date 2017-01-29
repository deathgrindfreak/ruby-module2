User.destroy_all
Profile.destroy_all
TodoList.destroy_all
TodoItem.destroy_all

users = User.create! [
  { username: "Fiorina", password_digest: "carlyrules101" },
  { username: "Trump", password_digest: "hillarysucks" },
  { username: "Carson", password_digest: "benbenbenbenbenben" },
  { username: "Clinton", password_digest: "donaldsucks" }
]

Profile.create! [
  { gender: "female", birth_year: 1954, first_name: "Carly", last_name: "Fiorina", user_id: users[0].id },
  { gender: "male", birth_year: 1946, first_name: "Donald", last_name: "Trump", user_id: users[1].id },
  { gender: "male", birth_year: 1951, first_name: "Ben", last_name: "Carson", user_id: users[2].id },
  { gender: "female", birth_year: 1947, first_name: "Hillary", last_name: "Clinton", user_id: users[3].id }
]

lists = TodoList.create! [
  { list_name: "How to run a company into the ground", list_due_date: Date.today + 1.year, user_id: users[0].id },
  { list_name: "Why I'm the greatest ...", list_due_date: Date.today + 1.year, user_id: users[1].id },
  { list_name: "Ben Ben Ben ...", list_due_date: Date.today + 1.year, user_id: users[2].id },
  { list_name: "Why I'll be president in 2017", list_due_date: Date.today + 1.year, user_id: users[3].id }
]

items = lists.map do |list|
  (1..5).map do |i|
    { due_date: Date.today + 1.year, title: "TODO Create title", description: "TODO Create Description",
      completed: false, todo_list_id: list.id }
  end
end

TodoItem.create! items
