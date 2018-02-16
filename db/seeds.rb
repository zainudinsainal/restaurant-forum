Category.destroy_all

category_list =[
  { name: "Chinese cuisine" },
  { name: "Japanese cuisine" },
  { name: "Italian cuisine" },
  { name: "Mexican cuisine" },
  { name: "Vegetarian cuisine" },
  { name: "American cuisine" },
  { name: "Fusion cuisine" }
]

category_list.each do |category|
  Category.create( name: category[:name] )
end
puts "Category created!"

User.create(email: "root@example.com", password: "12345678", role: "admin")
puts "Default admin created!"