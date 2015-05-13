# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

locations = Location.create([
  {name:'The Winchester Mystery House', address:'525 S Winchester Blvd San Jose, CA 95128', yelp_id:'winchester-mystery-house-san-jose'},
  {name:'Antelope Canyon, Arizona', address:'55 S Lake Powell Blvd Page, AZ 86040', yelp_id:'lower-antelope-canyon-page'},
  {name:'Watkins Glen State Park', address:'1009 N Franklin St Watkins Glen, NY 14891', yelp_id:'watkins-glen-state-park-watkins-glen'},
  {name:'Grand Prismatic Spring', address:'Grand Loop Rd Yellowstone National Park, WY 82190', yelp_id:'grand-prismatic-spring-yellowstone-national-park'},
 {name:'Calsbad Caverns National Park', address:'190 Reef Top Cir Carlsbad, NM 88220', yelp_id:'carlsbad-caverns-national-park-carlsbad'},
  {name:'Hamilton Pool Nature Preserve', address:'24300 Hamilton Pool Rd Dripping Springs, TX 78620', yelp_id:'hamilton-pool-nature-preserve-dripping-springs'},
  {name:'Bryce Canyon National Park', address:'Hwy 63/1 Park Rd Bryce Canyon, UT 84764', yelp_id:'bryce-canyon-national-park-bryce-canyon'},
  {name:'The Wave at Coyote Buttes', address:'381 N 100 E Kanab, UT 84741', yelp_id:'the-wave-at-coyote-buttes-kanab'},
  {name:'Sequoia National Park', address:'Highway 198 Sequoia National Park, CA 93262', yelp_id:'general-sherman-tree-sequoia-national-park'},
  {name:"Thor's Well", address:'2311-2399 Oregon Coast Hwy Siuslaw National Forest Florence, OR 97439', yelp_id:'thors-well-florence'},







  ])