Category.create(name: "Service")
Category.create(name: "Time")
Category.create(name: "Money")
Category.create(name: "Object")

pocahontas = User.create(first_name: "Pocahontas", email: "complianceinfo@epa.gov", zipcode: 58401, password: "1234", company: false)
reid = User.create(first_name: "Reid", last_name: "Lewis", email: "reidhlewis91@gmail.com", zipcode: 94107, password: "1234", company: false)
colin = User.create(first_name: "Colin", last_name: "Craft", email: "colin@colincraft.com", zipcode: 94573, password: "1234", company: false)
arebeth = User.create(first_name: "Arebeth", last_name: "Pease", email: "arebeth@herself.com", zipcode: 94619, password: "1234", company: false)
christian = User.create(first_name: "Christian", last_name: "Chandler", email: "christian@himself.com", zipcode: 94805, password: "1234", company: false)
george = User.create(first_name: "George", last_name: "Washington", email: "dafirst@america.com", zipcode: 10001, password: "1234", company: false)
sacagawea = User.create(first_name: "Sacagawea", email: "sacagawea@guides.com", zipcode: 45845, password: "1234", company: false)
abraham = User.create(first_name: "Abraham", last_name: "Lincoln", email: "luckysixteen@americannorth.com", zipcode: 42748, password: "1234", company: false)
teddy = User.create(first_name: "Theodore", last_name: "Roosevelt", email: "roughrider@america.com", zipcode: 10004, password: "1234", company: false)
franklin = User.create(first_name: "Franklin", last_name: "Roosevelt", email: "fdr@marchofdimes.com", zipcode: 12538, password: "1234", company: false)
ron = User.create(first_name: "Ron", last_name: "Swanson", email: "dontemailme@antigov.com", zipcode: 46035, password: "1234", company: false)


ga = User.create(first_name: "General Assembly", email: "ga.ga.co", zipcode:94117 , password: "1234", company: true)
chobe = User.create(first_name: "Chobe Game Lodge", email: "chobegamelodge@botswana.org", zipcode:98776 , password: "1234", company: true)

pocahontas.gifts.create(title: "Woodland Knowledge", description: "I can teach you how to live off the land!", type_id: 1, category_id: 1)
pocahontas.gifts.create(title: "English Help", description: "I'm looking for help learning the English language.", type_id: 2, category_id: 1)

reid.gifts.create(title: "Pencil Sharpener", description: "I have a pencil sharpener to offer!", type_id: 1, category_id: 4)
reid.gifts.create(title: "Gardening Help", description: "I'm a novice gardener, looking for some help!", type_id: 2, category_id: 1)

colin.gifts.create(title: "Wine", description: "I have a few extra bottles.", type_id: 1, category_id: 4)
colin.gifts.create(title: "Patrick", description: "I'm earnesting!", type_id: 2, category_id: 1)

arebeth.gifts.create(title: "Lemons", description: "I've got delicous lemons to give away from my tree!", type_id: 1, category_id: 4)
arebeth.gifts.create(title: "Socks", description: "Looking for someone to repair my socks!", type_id: 2, category_id: 1)

christian.gifts.create(title: "Databases", description: "I have experience in database management that I'm willing to share.", type_id: 1 , category_id: 1)
christian.gifts.create(title: "My neighbor's lawn", description: "My elderly neighbor really needs somebody to help mow her lawn.", type_id: 2, category_id: 2)

george.gifts.create(title: "First President", description: "I can be the first president of your emerging nation.", type_id: 1, category_id: 1)
george.gifts.create(title: "Less Taxation", description: "I don't really dig how much the crown is taxing us. Trying to stop that.", type_id: 2, category_id: 3)

sacagawea.gifts.create(title: "Guide Knowledge", description: "I can help guide you through the American West", type_id: 1, category_id: 1)
sacagawea.gifts.create(title: "Babysitter", description: "Looking for a babysitter on Tuesdays and Thursdays.", type_id: 2, category_id: 2)


abraham.gifts.create(title: "Hard Work", description: "I've worked hard my whole life, and have some free time to do so.", type_id: 1, category_id: 2)
abraham.gifts.create(title: "Boat Pole", description: "I'm in need of a new flat boat pushing pole.", type_id: 2, category_id: 4)

teddy.gifts.create(title: "National Park Protection Grants", description: "I was recently able to push congress to grant some money for national park protection.", type_id: 1, category_id: 3)
teddy.gifts.create(title: "Medic", description: "One of my Rough Riders is in need of medical help.", type_id: 2, category_id: 1)

franklin.gifts.create(title: "Rural Electrification", description: "I'd like to bring electricity to help modernize rural America.", type_id: 1, category_id: 1)
franklin.gifts.create(title: "Better Doctor", description: "The doctor managing my declining condition is sucking, and I'm looking for new medical help.", type_id: 2, category_id: 1)

ron.gifts.create(title: "Woodworking Expertise", description: "I have woodworking knowledge I'd like to share.", type_id: 1, category_id: 1)
ron.gifts.create(title: "Less Taxation", description: "I hate taxes.", type_id: 2, category_id: 3)


ga.gifts.create(title: "Scholarship!", description: "We would like to offer a scholarship to a student in need!", type_id: 1, category_id: 3)
ga.gifts.create(title: "Power Plugs", description: "We're in need of some new power plugs for our classrooms.", type_id: 2, category_id: 4)

chobe.gifts.create(title: "Safari Experience", description: "We have some extra spots on our morning safaris we're hoping to give out.", type_id: 1, category_id: 1)
chobe.gifts.create(title: "Stop Urban Sprawl", description: "Our nature reserves are dwindling. Please donate to help preserve Botswana's beauties!", type_id: 2, category_id: 3)