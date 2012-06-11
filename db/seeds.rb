# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if User.find_by_email("admin@tss.com").nil?
User.create!(:email=>'admin@tss.com',:password=>'secret',:password_confirmation=>'secret',:admin=>true)
end

@contact=Contact.create!(:name=>"Administrator")
Email.create!(:name=>"admin@tss.com",:contact_id=>@contact.id)
Phone.create!(:name=>"9769655345",:contact_id=>@contact.id)

ContactType.create!(:name=>'Client')
ContactType.create!(:name=>'Partner')
ContactType.create!(:name=>'Vendor')
@admin=ContactType.create!(:name=>'Employee')
ContactType.create!(:name=>'Friend')

@contact.contact_types << @admin



MovingRequirement.create!(:name=>"Landlord NOC")
MovingRequirement.create!(:name=>"Police Notification")
MovingRequirement.create!(:name=>"Clubhouse Formalities")

Quality.create!(:name=>"Great",:value=>"3")
Quality.create!(:name=>"Regular",:value=>"2")
Quality.create!(:name=>"Budget",:value=>"1")

City.create!(:name=>"Mumbai")

Area.create!(:name=>"Mahim",:city_id=>'1')
Area.create!(:name=>"Bandra",:city_id=>'1')
Area.create!(:name=>"Andheri",:city_id=>'1')

Locality.create!(:name=>"Mahim West",:area_id=>'1',:quality_id=>'2')
Locality.create!(:name=>"Cadell Road",:area_id=>'1',:quality_id=>'3')
Locality.create!(:name=>"Reclamation",:area_id=>'2',:quality_id=>'2')
Locality.create!(:name=>"Union Park",:area_id=>'2',:quality_id=>'1')
Locality.create!(:name=>"Poonam Nagar",:area_id=>'3',:quality_id=>'1')

BhkConfig.create!(:name=>'1 RK')
BhkConfig.create!(:name=>'1 BHK')
BhkConfig.create!(:name=>'1.5 BHK')
BhkConfig.create!(:name=>'2 BHK')
BhkConfig.create!(:name=>'2.5 BHK')
BhkConfig.create!(:name=>'3 BHK')
BhkConfig.create!(:name=>'4 BHK')
BhkConfig.create!(:name=>'Villa')
BhkConfig.create!(:name=>'PG')

PoiType.create!(:name=>'Building')
PoiType.create!(:name=>'Main Road')
PoiType.create!(:name=>'Railway Station')
PoiType.create!(:name=>'Bus Depot')
PoiType.create!(:name=>'Shopping Mall')
PoiType.create!(:name=>'Cinema Theatre')
PoiType.create!(:name=>'Temple')
PoiType.create!(:name=>'Church')
PoiType.create!(:name=>'Mosque')
PoiType.create!(:name=>'School')
PoiType.create!(:name=>'Hospital')
PoiType.create!(:name=>'Garden')
PoiType.create!(:name=>'Museum')
PoiType.create!(:name=>'Market')
PoiType.create!(:name=>'Place of Worship')
PoiType.create!(:name=>'Airport')

Facility.create!(:name=>'Clubhouse', :is_building=>true)
FacilityFeature.create!(:name=>'Carrom', :facility_id=>1)
FacilityFeature.create!(:name=>'Card Tables', :facility_id=>1)
FacilityFeature.create!(:name=>'Banquet Hall', :facility_id=>1)
FacilityFeature.create!(:name=>'Auditorium', :facility_id=>1)
FacilityFeature.create!(:name=>'Bar', :facility_id=>1)
FacilityFeature.create!(:name=>'Snacks', :facility_id=>1)
FacilityFeature.create!(:name=>'Video games', :facility_id=>1)

Facility.create!(:name=>'Gym', :is_building=>true)
FacilityFeature.create!(:name=>'Treadmill', :facility_id=>2)
FacilityFeature.create!(:name=>'Weights', :facility_id=>2)
FacilityFeature.create!(:name=>'Biking machines', :facility_id=>2)
FacilityFeature.create!(:name=>'Professional Trainers', :facility_id=>2)
FacilityFeature.create!(:name=>'Weight machines', :facility_id=>2)
FacilityFeature.create!(:name=>'Rowing machines', :facility_id=>2)

Facility.create!(:name=>'Swimming Pool', :is_building=>true)
FacilityFeature.create!(:name=>'Regular pool', :facility_id=>3)
FacilityFeature.create!(:name=>'Kiddie pool', :facility_id=>3)
FacilityFeature.create!(:name=>'Olympic size pool', :facility_id=>3)
FacilityFeature.create!(:name=>'Diving boards', :facility_id=>3)
FacilityFeature.create!(:name=>'Lap pool', :facility_id=>3)
FacilityFeature.create!(:name=>'Jacuzzi', :facility_id=>3)

Facility.create!(:name=>'Sports Courts', :is_building=>true)
FacilityFeature.create!(:name=>'Tennis', :facility_id=>4)
FacilityFeature.create!(:name=>'Badminton', :facility_id=>4)
FacilityFeature.create!(:name=>'Table Tennis', :facility_id=>4)
FacilityFeature.create!(:name=>'Billiards', :facility_id=>4)
FacilityFeature.create!(:name=>'Squash', :facility_id=>4)
FacilityFeature.create!(:name=>'Basketball', :facility_id=>4)

Facility.create!(:name=>'Visitor Parking', :is_building=>true)
FacilityFeature.create!(:name=>'Plenty of visitor parking', :facility_id=>5)
FacilityFeature.create!(:name=>'Limited Visitor parking', :facility_id=>5)

Facility.create!(:name=>'Childrens Play Area', :is_building=>true)
FacilityFeature.create!(:name=>'Slides', :facility_id=>6)
FacilityFeature.create!(:name=>'Swings', :facility_id=>6)
FacilityFeature.create!(:name=>'Seesaws', :facility_id=>6)
FacilityFeature.create!(:name=>'Sandpit', :facility_id=>6)
FacilityFeature.create!(:name=>'Climbing Cage', :facility_id=>6)
FacilityFeature.create!(:name=>'Rides', :facility_id=>6)

Facility.create!(:name=>'Gated Community', :is_building=>true)
FacilityFeature.create!(:name=>'Walking track', :facility_id=>7)
FacilityFeature.create!(:name=>'Lawns', :facility_id=>7)
FacilityFeature.create!(:name=>'Garden', :facility_id=>7)
FacilityFeature.create!(:name=>'Intercom', :facility_id=>7)
FacilityFeature.create!(:name=>'Lift', :facility_id=>7)
FacilityFeature.create!(:name=>'Service Lift', :facility_id=>7)
FacilityFeature.create!(:name=>'Skating Rink', :facility_id=>7)

Facility.create!(:name=>'Security', :is_building=>true)
FacilityFeature.create!(:name=>'At building entrance', :facility_id=>8)
FacilityFeature.create!(:name=>'At Community entrance', :facility_id=>8)

Restriction.create!(:name=>'No Single Men')
Restriction.create!(:name=>'No Single Women')
Restriction.create!(:name=>'No Non-vegetarian')
Restriction.create!(:name=>'No Corporate Lease')
Restriction.create!(:name=>'No Individual Lease')
Restriction.create!(:name=>'No Guest house')
Restriction.create!(:name=>'No Pets')

Service.create!(:name=>'Restaurant')
Service.create!(:name=>'Electrician')
Service.create!(:name=>'Plumber')
Service.create!(:name=>'Grocery Store')
Service.create!(:name=>'Maid Service')

ParkingType.create!(:name=>'Reserved Open Parking')
ParkingType.create!(:name=>'Reserved Covered Parking')
ParkingType.create!(:name=>'Open Parking')

BathroomType.create!(:name=>'Indian Toilet')
BathroomType.create!(:name=>'Western Toilet')
BathroomType.create!(:name=>'Integrated Bathroom and Toilet')

Direction.create!(:name=>'North')
Direction.create!(:name=>'North-East')
Direction.create!(:name=>'East')
Direction.create!(:name=>'South-East')
Direction.create!(:name=>'South')
Direction.create!(:name=>'South-West')
Direction.create!(:name=>'West')
Direction.create!(:name=>'North-West')

BalconyType.create!(:name=>'Balcony')
BalconyType.create!(:name=>'Sit-out')
BalconyType.create!(:name=>'Terrace')

Facility.create!(:name=>'Furniture', :is_building=>false)
FacilityFeature.create!(:name=>'Dining table', :facility_id=>9)
FacilityFeature.create!(:name=>'Dining chairs', :facility_id=>9)
FacilityFeature.create!(:name=>'Sofa', :facility_id=>9)
FacilityFeature.create!(:name=>'Chairs', :facility_id=>9)
FacilityFeature.create!(:name=>'Beds', :facility_id=>9)
FacilityFeature.create!(:name=>'TV Cabinets', :facility_id=>9)

Facility.create!(:name=>'White Goods', :is_building=>false)
FacilityFeature.create!(:name=>'TV', :facility_id=>10)
FacilityFeature.create!(:name=>'Fridge', :facility_id=>10)
FacilityFeature.create!(:name=>'Microwave', :facility_id=>10)
FacilityFeature.create!(:name=>'Water purifier', :facility_id=>10)
FacilityFeature.create!(:name=>'Fans', :facility_id=>10)
FacilityFeature.create!(:name=>'Window Acs', :facility_id=>10)
FacilityFeature.create!(:name=>'Split Acs', :facility_id=>10)
FacilityFeature.create!(:name=>'Washing machine', :facility_id=>10)

Facility.create!(:name=>'Kitchen', :is_building=>false)
FacilityFeature.create!(:name=>'Modular kitchen', :facility_id=>11)
FacilityFeature.create!(:name=>'Piped Gas', :facility_id=>11)
FacilityFeature.create!(:name=>'Cylinders provided', :facility_id=>11)
FacilityFeature.create!(:name=>'Electric Gas', :facility_id=>11)
FacilityFeature.create!(:name=>'Electric Chimney', :facility_id=>11)

Facility.create!(:name=>'Wardrobes', :is_building=>false)
FacilityFeature.create!(:name=>'Integrated wardrobes', :facility_id=>12)
FacilityFeature.create!(:name=>'Wardrobes provided', :facility_id=>12)
FacilityFeature.create!(:name=>'No Wardrobes', :facility_id=>12)

Facility.create!(:name=>'Layout', :is_building=>false)
FacilityFeature.create!(:name=>'French windows', :facility_id=>13)
FacilityFeature.create!(:name=>'Dry Area', :facility_id=>13)
FacilityFeature.create!(:name=>'Servant Quarters', :facility_id=>13)
FacilityFeature.create!(:name=>'Water storage loft', :facility_id=>13)

Facility.create!(:name=>'Utilities', :is_building=>false)
FacilityFeature.create!(:name=>'Landline available', :facility_id=>14)
FacilityFeature.create!(:name=>'Internet available', :facility_id=>14)
FacilityFeature.create!(:name=>'DTH', :facility_id=>14)
FacilityFeature.create!(:name=>'Cable', :facility_id=>14)

# TODO Add Labelling Type

Labelling.create!(:name=>'ASS',:is_flat_contact_label=>false)
Labelling.create!(:name=>'ASS +',:is_flat_contact_label=>false)
Labelling.create!(:name=>'ASS >',:is_flat_contact_label=>false)
Labelling.create!(:name=>'ASS ?',:is_flat_contact_label=>false)
Labelling.create!(:name=>'ASS >>',:is_flat_contact_label=>false)
Labelling.create!(:name=>'ASSF',:is_flat_contact_label=>false)

Labelling.create!(:name=>'LLP',:is_flat_contact_label=>false)
Labelling.create!(:name=>'LLC',:is_flat_contact_label=>false)
Labelling.create!(:name=>'LLF',:is_flat_contact_label=>false)
Labelling.create!(:name=>'LL ?',:is_flat_contact_label=>false)
Labelling.create!(:name=>'LL >>',:is_flat_contact_label=>false)

Labelling.create!(:name=>'Reference',:is_flat_contact_label=>true)
Labelling.create!(:name=>'Tenant',:is_flat_contact_label=>true)
Labelling.create!(:name=>'Landlord',:is_flat_contact_label=>true)
Labelling.create!(:name=>'Cleaning Client',:is_flat_contact_label=>true)
Labelling.create!(:name=>'Broker',:is_flat_contact_label=>true)

Labelling.create!(:name=>'Ignore',:is_flat_contact_label=>false)
Labelling.create!(:name=>'Priority',:is_flat_contact_label=>false)
Labelling.create!(:name=>'Important',:is_flat_contact_label=>false)
Labelling.create!(:name=>'Regular',:is_flat_contact_label=>false)
Labelling.create!(:name=>'Revisit',:is_flat_contact_label=>false)
Labelling.create!(:name=>'Demanding',:is_flat_contact_label=>false)

Flatype.create!(:name=>'Direct')
Flatype.create!(:name=>'Partner')
Flatype.create!(:name=>'Broker')
Flatype.create!(:name=>'TBO')

Furnstat.create!(:name=>"Furnished")
Furnstat.create!(:name=>"Semi-Furnished")
Furnstat.create!(:name=>"Unfurnished")
Furnstat.create!(:name=>"Bare")

InteractionType.create(name:"Note")
InteractionType.create(name:"Meet")
InteractionType.create(name:"Email")
InteractionType.create(name:"Call")
InteractionType.create(name:"Showing")

RentYear.create!(:name=>"2012")
RentYear.create!(:name=>"2013")
RentYear.create!(:name=>"2014")
RentYear.create!(:name=>"2015")
RentYear.create!(:name=>"2016")