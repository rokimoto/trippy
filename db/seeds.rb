users = User.create([
  {name: "Rachel Okimoto", email: "rachel.okimoto@gmail.com", password: "rachel", role: "admin"},
  {name: "Dustin Baker", email: "dustin.t.baker22@gmail.com", password: "dustin", role: "admin"},
  {name: "Will Carron", email: "wacarron27@gmail.com", password: "will", role: "admin"}
])



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
  {name:'Badlands National Park', address:'Rockyford Kyle, SD 57752', yelp_id:'badlands-national-park-kyle'},
  {name:'Cadillac Ranch', address:'I-40 Amarillo, TX 79124 b/t I-40 & Hope Rd', yelp_id:'cadillac-ranch-amarillo'},
  {name:'Wacko Soap Plant', address:'4633 Hollywood Blvd Los Angeles, CA 90027', yelp_id:'wacko-soap-plant-los-angeles'},
  {name:'Venice Beach', address:'1500 Ocean Front Walk Venice, CA 90291', yelp_id:'venice-beach-venice'},
  {name:'Los Angeles County Museum of Art', address:'5905 Wilshire Blvd Los Angeles, CA 90036', yelp_id:'los-angeles-county-museum-of-art-los-angeles-7'},
  {name:'Griffith Observatory', address:'2800 E Observatory Rd Los Angeles, CA 90027', yelp_id:'griffith-observatory-los-angeles-2'},
  {name:'Watts Tower', address:'1727 E 107th St Los Angeles, CA 90002', yelp_id:'watts-towers-arts-center-los-angeles'},
  {name:'Huntington Botanical Gardens', address:'1151 Oxford Rd San Marino, CA 91108', yelp_id:'huntington-library-art-collections-and-botanical-gardens-san-marino'},
  {name:'La Brea Tar Pits', address:'Wilshire Blvd Los Angeles, CA', yelp_id:'la-brea-tar-pits-los-angeles-2'},
  {name:'Sunken City', address:'500 W Paseo Del Mar San Pedro, CA 90731', yelp_id:'sunken-city-san-pedro'},
  {name:'The Abnormalarts', address:'11334 Burbank Blvd North Hollywood, CA 91601', yelp_id:'cia-the-california-institute-of-abnormalarts-north-hollywood'},
  {name:'The Museum of Death', address:'6031 Hollywood Blvd Los Angeles, CA 90028', yelp_id:'museum-of-death-los-angeles-2'},
  {name:'The Museum of Jurassic Technology', address:'9341 Venice Blvd Culver City, CA 90232', yelp_id:'the-museum-of-jurassic-technology-culver-city'},
  {name:'Runyon Canyon Park', address:'2001 N Fuller Ave Los Angeles, CA 90046', yelp_id:'runyon-canyon-park-los-angeles-2'},
  {name:'Potato Chip Rock', address:'14644 Lake Poway Rd Poway, CA 92064', yelp_id:'potato-chip-rock-poway'},
  {name:'Salvation Mountain', address:'Beal Rd Niland, CA 92257', yelp_id:'salvation-mountain-niland'},
  {name:'Center of The World', address:'1 Center of the World Dr Felicity, CA 92283', yelp_id:'center-of-the-world-felicity-2'},
  {name:'Cabazon Dinosaurs', address:'50800 Seminole Dr Cabazon, CA 92230', yelp_id:'cabazon-dinosaurs-cabazon'},
  {name:'Time Travel Mart', address:'1714 W Sunset Blvd Los Angeles, CA 90026', yelp_id:'time-travel-mart-los-angeles'},
  {name:'Lava Tubes', address:'2701 Barstow Rd Barstow, CA 92311', yelp_id:'mojave-national-preserve-barstow-2'},
  {name:'Bubblegum Alley', address:'733.5 Higuera Street San Luis Obispo, CA 93401', yelp_id:'bubblegum-alley-san-luis-obispo-2'},
  {name:'Paramount Ranch', address:'2903 Cornell Rd Agoura Hills, CA 91301', yelp_id:'paramount-ranch-agoura-hills'},
  {name:'Marfa Mystery Lights Viewing Area', address:'Hwy 90 Marfa, TX 79843', yelp_id:'marfa-mystery-lights-viewing-area-marfa'},
  {name:'Oregon Vortex Mystery House', address:'4303 Sardine Crk L Frk Rd Gold Hill, OR 97525', yelp_id:'house-of-mystery-at-the-oregon-vortex-gold-hill'},
  {name:'Petrified Wood Park', address:'500 Main Ave Lemmon, SD 57638', yelp_id:'the-petrified-wood-park-and-museum-lemmon'},
  {name:'Coral Castle', address:'28655 S Dixie Hwy Homestead, FL 33033', yelp_id:'coral-castle-homestead'},
  {name:'International Banana Museum', address:'98775 Hwy 111 Mecca, CA 92254', yelp_id:'international-banana-museum-mecca'},
  {name:'The Bonnie and Clyde Death Car', address:'31900 S Las Vegas Blvd Primm, NV 89019', yelp_id:'primm-valley-resort-and-casino-primm'},
  {name:"Minister's Tree House", address:'Beehive Lane Crossville, TN 38571', yelp_id:'ministers-tree-house-crossville'},
  {name:'Town Atop A Burning Coal Mine', address:'Centralia, PA 17921', yelp_id:'centralia-centralia-4'},
  {name:'Big Tree Drive-Thru', address:'67402 Drive Thru Tree Road Leggett, CA 95585', yelp_id:'drive-thru-tree-leggett'},
  {name:"Hershey's Chocolate World", address:'251 Park Blvd Hershey, PA 17033', yelp_id:'hersheys-chocolate-world-hershey'},
  {name:'Kaatskill Kaleidoscope', address:'5340 Route 28 Mount Tremper, NY 12457', yelp_id:'kaatskill-kaleidoscope-mount-tremper'},
  {name:'The Thing?', address:'2631 N Johnson Rd Dragoon, AZ 85609', yelp_id:'the-thing-dragoon'},
  {name:"Cano's Castle", address:'Hwy 285 Antonito, CO 81120', yelp_id:'canos-castle-antonito'},
  {name:'Largest Ball of Twine', address:'Darwin, MN 55324', yelp_id:'worlds-largest-ball-of-twine-darwin'},
  {name:"Nicolas Cage's Tomb", address:'320 N Claiborne Ave New Orleans, LA 70112', yelp_id:'st-louis-cemetery-2-new-orleans-2'},
  {name:'A Chocolate Moose', address:'419 US Rt 1 Scarborough, ME 04074',yelp_id:'len-libby-candy-shops-scarborough'},
  {name:'National Atomic Testing Museum', address:'755 E Flamingo Rd Las Vegas, NV 89119', yelp_id:'national-atomic-testing-museum-las-vegas'},
  {name:'Area 51 Alien Travel Center', address:'2711 E US Hwy 95 Amargosa Valley, NV 89020', yelp_id:'area-51-alien-travel-center-amargosa-valley'},
])



