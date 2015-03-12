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

pocahontas = User.create(first_name: "Pocahontas", last_name: "Matoaka", email: "complianceinfo@epa.gov", zipcode: "58401", password: "1234", profile_pic: "http://www.disneystoryoriginspodcast.com/wp-content/uploads/2013/11/pocahontas1.jpg")
reid = User.create(first_name: "Reid", last_name: "Lewis", email: "reidhlewis91@gmail.com", zipcode: "94107", password: "1234", profile_pic: "https://scontent-ord.xx.fbcdn.net/hphotos-prn2/v/t1.0-9/11222_10151979387447189_781049594_n.jpg?oh=44a77aa421d03be4113a3a731848f6e8&oe=5589E6B4")
colin = User.create(first_name: "Colin", last_name: "Craft", email: "colin@colincraft.com", zipcode: "94573", password: "1234", profile_pic: "https://fbcdn-sphotos-h-a.akamaihd.net/hphotos-ak-xpa1/v/t1.0-9/284844_2278937778648_4459543_n.jpg?oh=c46b7d2cfc06776148f64494aad8a01a&oe=55806CB3&__gda__=1434405970_defb376448edfc6aaec3004ebf065e25")
arebeth = User.create(first_name: "Arebeth", last_name: "Pease", email: "arebeth@herself.com", zipcode: "94619", password: "1234", profile_pic: "https://fbcdn-sphotos-e-a.akamaihd.net/hphotos-ak-xfa1/v/t1.0-9/1932216_10202611860999069_5949603230392118969_n.jpg?oh=f966759408926ee8711c42f992825b25&oe=55841B8D&__gda__=1434339078_420c781d678237ebcf626c44d657c0e4")
christian = User.create(first_name: "Christian", last_name: "Chandler", email: "christian@himself.com", zipcode: "94805", password: "1234", profile_pic: "https://lh4.googleusercontent.com/-nyp7_sz--Ek/UilbmNx6-xI/AAAAAAAAAPM/TdtmfoSf7qc/w506-h750/photo.jpg")
george = User.create(first_name: "George", last_name: "Washington", email: "dafirst@america.com", zipcode: "10001", password: "1234", profile_pic: "http://assets3.thrillist.com/v1/image/1184540/size/tl-horizontal_main/george-washington-s-farewell-party-bar-tab-proves-he-s-the-greatest-american-ever")
sacagawea = User.create(first_name: "Sacagawea", last_name: "Sacajawea", email: "sacagawea@guides.com", zipcode: "45845", password: "1234", profile_pic: "data:image/jpeg;base64,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")
abraham = User.create(first_name: "Abraham", last_name: "Lincoln", email: "luckysixteen@americannorth.com", zipcode: "42748", password: "1234", profile_pic: "http://img.timeinc.net/time/photoessays/2009/lincoln/lincoln_01.jpg")
teddy = User.create(first_name: "Theodore", last_name: "Roosevelt", email: "roughrider@america.com", zipcode: "10004", password: "1234", profile_pic: "http://www.uncompromisingcommitment.org/wp-content/sdaolpu/2012/11/UC-Teddy.jpg")
franklin = User.create(first_name: "Franklin", last_name: "Roosevelt", email: "fdr@marchofdimes.com", zipcode: "12538", password: "1234", profile_pic: "http://stmedia.startribune.com/images/8Prezsmoke0728.jpg")
ron = User.create(first_name: "Ron", last_name: "Swanson", email: "dontemailme@antigov.com", zipcode: "46035", password: "1234", profile_pic: "http://s2.freebeacon.com/up/2012/12/Ron-Swanson-AP.png")

pocahontas.gifts.create(title: "Woodland Knowledge", description: "I can teach you how to live off the land!", type_id: 1, category_id: 1)
pocahontas.gifts.create(title: "English Help", description: "I'm looking for help learning the English language.", type_id: 2, category_id: 1)

reid.gifts.create(title: "Pencil Sharpener", description: "I have a pencil sharpener to offer! Seriously. This thing. Is So. Blue. Like, you mightget lost in its blue when your sharpening, so be careful. Time flies (or I guess, swims. Tee hee hee) when you're sharpening fun! Oh! On another note:don't oversharpen! This thing is like tooo good. You could seriously oversharpen your pencil if you get lost in the blue, and suddenly your flat, full pencil is a razor sharp nub. Terrible, terrible times have happened.", type_id: 1, category_id: 4)
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