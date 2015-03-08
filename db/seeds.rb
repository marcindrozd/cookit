# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
alice = User.create(full_name: "Alice Wonderland", email_address: "alice@example.com", password: "password")

desserts = Category.create(name: 'Desserts')
main_courses = Category.create(name: 'Main Courses')
starters = Category.create(name: "Starters")

Recipe.create(title: "Delicious Ice Cream",
              ingredients: "Milk; Sugar; Vanilla stick",
              directions: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec eu semper velit, et accumsan eros. Quisque purus lacus, feugiat faucibus convallis nec, bibendum nec lorem. Donec scelerisque mi ac tincidunt bibendum. Suspendisse luctus varius justo a consectetur. Nunc tincidunt facilisis ex, in elementum eros hendrerit nec. Maecenas volutpat est sed tortor vestibulum, nec imperdiet libero ullamcorper. Nam vestibulum nibh id dolor dictum, nec pharetra quam consectetur. Curabitur egestas pharetra mi. Nulla interdum, nisl nec egestas commodo, erat leo porta ipsum, vel rutrum sapien libero ac velit. Nulla egestas nisi enim, nec cursus purus venenatis sed. Proin urna arcu, molestie dictum tellus vehicula, sagittis condimentum tellus. Curabitur pretium magna interdum elementum euismod. In ipsum elit, blandit nec venenatis at, ultricies nec sapien. Curabitur lobortis nec turpis tincidunt pellentesque.

                          Nullam fringilla scelerisque auctor. Nam eleifend posuere tellus, ac viverra ligula mattis non. Donec ultricies quis ligula ut auctor. Praesent ac ligula sagittis leo dictum malesuada. Nam aliquet malesuada hendrerit. In at dolor non odio imperdiet blandit. Pellentesque viverra in urna quis malesuada.",
              categories: [desserts],
              user: alice)

Recipe.create(title: "Spicy Tortillas",
              ingredients: "Tortilla; Beef; Tomatoes; Red pepper",
              directions: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec eu semper velit, et accumsan eros. Quisque purus lacus, feugiat faucibus convallis nec, bibendum nec lorem. Donec scelerisque mi ac tincidunt bibendum. Suspendisse luctus varius justo a consectetur. Nunc tincidunt facilisis ex, in elementum eros hendrerit nec. Maecenas volutpat est sed tortor vestibulum, nec imperdiet libero ullamcorper. Nam vestibulum nibh id dolor dictum, nec pharetra quam consectetur. Curabitur egestas pharetra mi. Nulla interdum, nisl nec egestas commodo, erat leo porta ipsum, vel rutrum sapien libero ac velit. Nulla egestas nisi enim, nec cursus purus venenatis sed. Proin urna arcu, molestie dictum tellus vehicula, sagittis condimentum tellus. Curabitur pretium magna interdum elementum euismod. In ipsum elit, blandit nec venenatis at, ultricies nec sapien. Curabitur lobortis nec turpis tincidunt pellentesque.

                          Nullam fringilla scelerisque auctor. Nam eleifend posuere tellus, ac viverra ligula mattis non. Donec ultricies quis ligula ut auctor. Praesent ac ligula sagittis leo dictum malesuada. Nam aliquet malesuada hendrerit. In at dolor non odio imperdiet blandit. Pellentesque viverra in urna quis malesuada.",
              categories: [main_courses, starters],
              user: alice)

Recipe.create(title: "Super Tasty Sandwiches",
              ingredients: "Bread; Salad; Tomato; Cheese; Mayo",
              directions: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec eu semper velit, et accumsan eros. Quisque purus lacus, feugiat faucibus convallis nec, bibendum nec lorem. Donec scelerisque mi ac tincidunt bibendum. Suspendisse luctus varius justo a consectetur. Nunc tincidunt facilisis ex, in elementum eros hendrerit nec. Maecenas volutpat est sed tortor vestibulum, nec imperdiet libero ullamcorper. Nam vestibulum nibh id dolor dictum, nec pharetra quam consectetur. Curabitur egestas pharetra mi. Nulla interdum, nisl nec egestas commodo, erat leo porta ipsum, vel rutrum sapien libero ac velit. Nulla egestas nisi enim, nec cursus purus venenatis sed. Proin urna arcu, molestie dictum tellus vehicula, sagittis condimentum tellus. Curabitur pretium magna interdum elementum euismod. In ipsum elit, blandit nec venenatis at, ultricies nec sapien. Curabitur lobortis nec turpis tincidunt pellentesque.

                          Nullam fringilla scelerisque auctor. Nam eleifend posuere tellus, ac viverra ligula mattis non. Donec ultricies quis ligula ut auctor. Praesent ac ligula sagittis leo dictum malesuada. Nam aliquet malesuada hendrerit. In at dolor non odio imperdiet blandit. Pellentesque viverra in urna quis malesuada.",
              categories: [starters],
              user: alice)

Recipe.create(title: "Pizza",
              ingredients: "Flour; Water; Grated Cheese; Mushrooms; Ketchup",
              directions: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec eu semper velit, et accumsan eros. Quisque purus lacus, feugiat faucibus convallis nec, bibendum nec lorem. Donec scelerisque mi ac tincidunt bibendum. Suspendisse luctus varius justo a consectetur. Nunc tincidunt facilisis ex, in elementum eros hendrerit nec. Maecenas volutpat est sed tortor vestibulum, nec imperdiet libero ullamcorper. Nam vestibulum nibh id dolor dictum, nec pharetra quam consectetur. Curabitur egestas pharetra mi. Nulla interdum, nisl nec egestas commodo, erat leo porta ipsum, vel rutrum sapien libero ac velit. Nulla egestas nisi enim, nec cursus purus venenatis sed. Proin urna arcu, molestie dictum tellus vehicula, sagittis condimentum tellus. Curabitur pretium magna interdum elementum euismod. In ipsum elit, blandit nec venenatis at, ultricies nec sapien. Curabitur lobortis nec turpis tincidunt pellentesque.

                          Nullam fringilla scelerisque auctor. Nam eleifend posuere tellus, ac viverra ligula mattis non. Donec ultricies quis ligula ut auctor. Praesent ac ligula sagittis leo dictum malesuada. Nam aliquet malesuada hendrerit. In at dolor non odio imperdiet blandit. Pellentesque viverra in urna quis malesuada.",
              categories: [main_courses, starters],
              user: alice)

Recipe.create(title: "Delicious Fish",
              ingredients: "Fish; Spices",
              directions: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec eu semper velit, et accumsan eros. Quisque purus lacus, feugiat faucibus convallis nec, bibendum nec lorem. Donec scelerisque mi ac tincidunt bibendum. Suspendisse luctus varius justo a consectetur. Nunc tincidunt facilisis ex, in elementum eros hendrerit nec. Maecenas volutpat est sed tortor vestibulum, nec imperdiet libero ullamcorper. Nam vestibulum nibh id dolor dictum, nec pharetra quam consectetur. Curabitur egestas pharetra mi. Nulla interdum, nisl nec egestas commodo, erat leo porta ipsum, vel rutrum sapien libero ac velit. Nulla egestas nisi enim, nec cursus purus venenatis sed. Proin urna arcu, molestie dictum tellus vehicula, sagittis condimentum tellus. Curabitur pretium magna interdum elementum euismod. In ipsum elit, blandit nec venenatis at, ultricies nec sapien. Curabitur lobortis nec turpis tincidunt pellentesque.

                          Nullam fringilla scelerisque auctor. Nam eleifend posuere tellus, ac viverra ligula mattis non. Donec ultricies quis ligula ut auctor. Praesent ac ligula sagittis leo dictum malesuada. Nam aliquet malesuada hendrerit. In at dolor non odio imperdiet blandit. Pellentesque viverra in urna quis malesuada.",
              categories: [main_courses],
              user: alice)

Recipe.create(title: "Giant Steak",
              ingredients: "Beef; Spices; Potatoes",
              directions: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec eu semper velit, et accumsan eros. Quisque purus lacus, feugiat faucibus convallis nec, bibendum nec lorem. Donec scelerisque mi ac tincidunt bibendum. Suspendisse luctus varius justo a consectetur. Nunc tincidunt facilisis ex, in elementum eros hendrerit nec. Maecenas volutpat est sed tortor vestibulum, nec imperdiet libero ullamcorper. Nam vestibulum nibh id dolor dictum, nec pharetra quam consectetur. Curabitur egestas pharetra mi. Nulla interdum, nisl nec egestas commodo, erat leo porta ipsum, vel rutrum sapien libero ac velit. Nulla egestas nisi enim, nec cursus purus venenatis sed. Proin urna arcu, molestie dictum tellus vehicula, sagittis condimentum tellus. Curabitur pretium magna interdum elementum euismod. In ipsum elit, blandit nec venenatis at, ultricies nec sapien. Curabitur lobortis nec turpis tincidunt pellentesque.

                          Nullam fringilla scelerisque auctor. Nam eleifend posuere tellus, ac viverra ligula mattis non. Donec ultricies quis ligula ut auctor. Praesent ac ligula sagittis leo dictum malesuada. Nam aliquet malesuada hendrerit. In at dolor non odio imperdiet blandit. Pellentesque viverra in urna quis malesuada.",
              categories: [main_courses],
              user: alice)

Recipe.create(title: "Homemade Hamburgers",
              ingredients: "Beef; Buns; Salad; Fresh Tomatoes; Pickles; Mustard; Ketchup",
              directions: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec eu semper velit, et accumsan eros. Quisque purus lacus, feugiat faucibus convallis nec, bibendum nec lorem. Donec scelerisque mi ac tincidunt bibendum. Suspendisse luctus varius justo a consectetur. Nunc tincidunt facilisis ex, in elementum eros hendrerit nec. Maecenas volutpat est sed tortor vestibulum, nec imperdiet libero ullamcorper. Nam vestibulum nibh id dolor dictum, nec pharetra quam consectetur. Curabitur egestas pharetra mi. Nulla interdum, nisl nec egestas commodo, erat leo porta ipsum, vel rutrum sapien libero ac velit. Nulla egestas nisi enim, nec cursus purus venenatis sed. Proin urna arcu, molestie dictum tellus vehicula, sagittis condimentum tellus. Curabitur pretium magna interdum elementum euismod. In ipsum elit, blandit nec venenatis at, ultricies nec sapien. Curabitur lobortis nec turpis tincidunt pellentesque.

                          Nullam fringilla scelerisque auctor. Nam eleifend posuere tellus, ac viverra ligula mattis non. Donec ultricies quis ligula ut auctor. Praesent ac ligula sagittis leo dictum malesuada. Nam aliquet malesuada hendrerit. In at dolor non odio imperdiet blandit. Pellentesque viverra in urna quis malesuada.",
              categories: [main_courses],
              user: alice)

Recipe.create(title: "Spaghetti Carbonara",
              ingredients: "Pasta; Bacon; Milk; Eggs;",
              directions: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec eu semper velit, et accumsan eros. Quisque purus lacus, feugiat faucibus convallis nec, bibendum nec lorem. Donec scelerisque mi ac tincidunt bibendum. Suspendisse luctus varius justo a consectetur. Nunc tincidunt facilisis ex, in elementum eros hendrerit nec. Maecenas volutpat est sed tortor vestibulum, nec imperdiet libero ullamcorper. Nam vestibulum nibh id dolor dictum, nec pharetra quam consectetur. Curabitur egestas pharetra mi. Nulla interdum, nisl nec egestas commodo, erat leo porta ipsum, vel rutrum sapien libero ac velit. Nulla egestas nisi enim, nec cursus purus venenatis sed. Proin urna arcu, molestie dictum tellus vehicula, sagittis condimentum tellus. Curabitur pretium magna interdum elementum euismod. In ipsum elit, blandit nec venenatis at, ultricies nec sapien. Curabitur lobortis nec turpis tincidunt pellentesque.

                          Nullam fringilla scelerisque auctor. Nam eleifend posuere tellus, ac viverra ligula mattis non. Donec ultricies quis ligula ut auctor. Praesent ac ligula sagittis leo dictum malesuada. Nam aliquet malesuada hendrerit. In at dolor non odio imperdiet blandit. Pellentesque viverra in urna quis malesuada.",
              categories: [main_courses],
              user: alice)
