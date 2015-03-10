User.destroy_all
Category.destroy_all
Comment.destroy_all
Gift.destroy_all
Zipcode.destroy_all

Category.create(name: "Service")
Category.create(name: "Time")
Category.create(name: "Money")
Category.create(name: "Object")

require 'csv'    

csv_text = File.read(File.expand_path('db/zipcodes.csv'))
csv = CSV.parse(csv_text, :headers => true)

ActiveRecord::Base.transaction do
  csv.each do |row|
    Zipcode.create!(row.to_hash)
  end
end

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

# ZipCode.create(zip: 00210, city: "Portsmouth", state: "NH", latitude: 43.005895, longitude: -71.013202)
# ZipCode.create(zip: aaaaa, city: "bbbbbb", state: "cc", latitude: ddddd, longitude: eeeee)

# SF specific zip codes range from 94099 to 94188
# ZipCode.create(zip: 94099, city: "South San Francisco", state: "CA", latitude: 37.381144, longitude: -122.334825)
# ZipCode.create(zip: 94101, city: "San Francisco", state: "CA", latitude: 37.784827, longitude: -122.727802)
# ZipCode.create(zip: 94102, city: "San Francisco", state: "CA", latitude: 37.779329, longitude: -122.41915)
# ZipCode.create(zip: 94103, city: "San Francisco", state: "CA", latitude: 37.772329, longitude: -122.41087)
# ZipCode.create(zip: 94104, city: "San Francisco", state: "CA", latitude: 37.791728, longitude: -122.4019)
# ZipCode.create(zip: 94105, city: "San Francisco", state: "CA", latitude: 37.789228, longitude: -122.3957)
# ZipCode.create(zip: 94106, city: "San Francisco", state: "CA", latitude: 37.784827, longitude: -122.727802)
# ZipCode.create(zip: 94107, city: "San Francisco", state: "CA", latitude: 37.766529, longitude: -122.39577)
# ZipCode.create(zip: 94108, city: "San Francisco", state: "CA", latitude: 37.792678, longitude: -122.40793)
# ZipCode.create(zip: 94109, city: "San Francisco", state: "CA", latitude: 37.792778, longitude: -122.42188)
# ZipCode.create(zip: 94110, city: "San Francisco", state: "CA", latitude: 37.74873,  longitude: -122.41545)
# ZipCode.create(zip: 94111, city: "San Francisco", state: "CA", latitude: 37.798228, longitude: -122.40027)
# ZipCode.create(zip: 94112, city: "San Francisco", state: "CA", latitude: 37.720931, longitude: -122.44241)
# ZipCode.create(zip: 94114, city: "San Francisco", state: "CA", latitude: 37.758434, longitude: -122.43512)
# ZipCode.create(zip: 94115, city: "San Francisco", state: "CA", latitude: 37.786129, longitude: -122.43736)
# ZipCode.create(zip: 94116, city: "San Francisco", state: "CA", latitude: 37.743381, longitude: -122.48578)
# ZipCode.create(zip: 94117, city: "San Francisco", state: "CA", latitude: 37.770937, longitude: -122.44276)
# ZipCode.create(zip: 94118, city: "San Francisco", state: "CA", latitude: 37.782029, longitude: -122.46158)
# ZipCode.create(zip: 94119, city: "San Francisco", state: "CA", latitude: 37.784827, longitude: -122.727802)
# ZipCode.create(zip: 94120, city: "San Francisco", state: "CA", latitude: 37.784827, longitude: -122.727802)
# ZipCode.create(zip: 94121, city: "San Francisco", state: "CA", latitude: 37.778729, longitude: -122.49265)
# ZipCode.create(zip: 94122, city: "San Francisco", state: "CA", latitude: 37.75838,  longitude: -122.48478)
# ZipCode.create(zip: 94123, city: "San Francisco", state: "CA", latitude: 37.801028, longitude: -122.43836)
# ZipCode.create(zip: 94124, city: "San Francisco", state: "CA", latitude: 37.732797, longitude: -122.39348)
# ZipCode.create(zip: 94125, city: "San Francisco", state: "CA", latitude: 37.784827, longitude: -122.727802)
# ZipCode.create(zip: 94126, city: "San Francisco", state: "CA", latitude: 37.784827, longitude: -122.727802)
# ZipCode.create(zip: 94127, city: "San Francisco", state: "CA", latitude: 37.734964, longitude: -122.4597)
# ZipCode.create(zip: 94128, city: "San Francisco", state: "CA", latitude: 37.621964, longitude: -122.39534)
# ZipCode.create(zip: 94129, city: "San Francisco", state: "CA", latitude: 37.79984,  longitude: -122.46167)
# ZipCode.create(zip: 94130, city: "San Francisco", state: "CA", latitude: 37.819423, longitude: -122.36966)
# ZipCode.create(zip: 94131, city: "San Francisco", state: "CA", latitude: 37.741797, longitude: -122.4378)
# ZipCode.create(zip: 94132, city: "San Francisco", state: "CA", latitude: 37.724231, longitude: -122.47958)
# ZipCode.create(zip: 94133, city: "San Francisco", state: "CA", latitude: 37.801878, longitude: -122.41018)
# ZipCode.create(zip: 94134, city: "San Francisco", state: "CA", latitude: 37.719581, longitude: -122.41085)
# ZipCode.create(zip: 94135, city: "San Francisco", state: "CA", latitude: 37.784827, longitude: -122.727802)
# ZipCode.create(zip: 94136, city: "San Francisco", state: "CA", latitude: 37.784827, longitude: -122.727802)
# ZipCode.create(zip: 94137, city: "San Francisco", state: "CA", latitude: 37.784827, longitude: -122.727802)
# ZipCode.create(zip: 94138, city: "San Francisco", state: "CA", latitude: 37.784827, longitude: -122.727802)
# ZipCode.create(zip: 94139, city: "San Francisco", state: "CA", latitude: 37.784827, longitude: -122.727802)
# ZipCode.create(zip: 94140, city: "San Francisco", state: "CA", latitude: 37.784827, longitude: -122.727802)
# ZipCode.create(zip: 94141, city: "San Francisco", state: "CA", latitude: 37.784827, longitude: -122.727802)
# ZipCode.create(zip: 94142, city: "San Francisco", state: "CA", latitude: 37.784827, longitude: -122.727802)
# ZipCode.create(zip: 94143, city: "San Francisco", state: "CA", latitude: 37.76313,  longitude: -122.458582)
# ZipCode.create(zip: 94144, city: "San Francisco", state: "CA", latitude: 37.784827, longitude: -122.727802)
# ZipCode.create(zip: 94145, city: "San Francisco", state: "CA", latitude: 37.784827, longitude: -122.727802)
# ZipCode.create(zip: 94146, city: "San Francisco", state: "CA", latitude: 37.784827, longitude: -122.727802)
# ZipCode.create(zip: 94147, city: "San Francisco", state: "CA", latitude: 37.784827, longitude: -122.727802)
# ZipCode.create(zip: 94150, city: "San Francisco", state: "CA", latitude: 37.784827, longitude: -122.727802)
# ZipCode.create(zip: 94151, city: "San Francisco", state: "CA", latitude: 37.784827, longitude: -122.727802)
# ZipCode.create(zip: 94152, city: "San Francisco", state: "CA", latitude: 37.784827, longitude: -122.727802)
# ZipCode.create(zip: 94153, city: "San Francisco", state: "CA", latitude: 37.784827, longitude: -122.727802)
# ZipCode.create(zip: 94154, city: "San Francisco", state: "CA", latitude: 37.784827, longitude: -122.727802)
# ZipCode.create(zip: 94155, city: "San Francisco", state: "CA", latitude: 37.784827, longitude: -122.727802)
# ZipCode.create(zip: 94156, city: "San Francisco", state: "CA", latitude: 37.784827, longitude: -122.727802)
# ZipCode.create(zip: 94157, city: "San Francisco", state: "CA", latitude: 37.784827, longitude: -122.727802)
# ZipCode.create(zip: 94159, city: "San Francisco", state: "CA", latitude: 37.784827, longitude: -122.727802)
# ZipCode.create(zip: 94160, city: "San Francisco", state: "CA", latitude: 37.784827, longitude: -122.727802)
# ZipCode.create(zip: 94161, city: "San Francisco", state: "CA", latitude: 37.784827, longitude: -122.727802)
# ZipCode.create(zip: 94162, city: "San Francisco", state: "CA", latitude: 37.784827, longitude: -122.727802)
# ZipCode.create(zip: 94163, city: "San Francisco", state: "CA", latitude: 37.784827, longitude: -122.727802)
# ZipCode.create(zip: 94164, city: "San Francisco", state: "CA", latitude: 37.784827, longitude: -122.727802)
# ZipCode.create(zip: 94165, city: "San Francisco", state: "CA", latitude: 37.784827, longitude: -122.727802)
# ZipCode.create(zip: 94166, city: "San Francisco", state: "CA", latitude: 37.784827, longitude: -122.727802)
# ZipCode.create(zip: 94167, city: "San Francisco", state: "CA", latitude: 37.784827, longitude: -122.727802)
# ZipCode.create(zip: 94168, city: "San Francisco", state: "CA", latitude: 37.784827, longitude: -122.727802)
# ZipCode.create(zip: 94169, city: "San Francisco", state: "CA", latitude: 37.784827, longitude: -122.727802)
# ZipCode.create(zip: 94170, city: "San Francisco", state: "CA", latitude: 37.784827, longitude: -122.727802)
# ZipCode.create(zip: 94171, city: "San Francisco", state: "CA", latitude: 37.784827, longitude: -122.727802)
# ZipCode.create(zip: 94172, city: "San Francisco", state: "CA", latitude: 37.784827, longitude: -122.727802)
# ZipCode.create(zip: 94175, city: "San Francisco", state: "CA", latitude: 37.784827, longitude: -122.727802)
# ZipCode.create(zip: 94177, city: "San Francisco", state: "CA", latitude: 37.784827, longitude: -122.727802)
# ZipCode.create(zip: 94188, city: "San Francisco", state: "CA", latitude: 37.784827, longitude: -122.727802)