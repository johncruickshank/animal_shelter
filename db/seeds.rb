require_relative("../models/owner")
require_relative("../models/animal")
require_relative("../models/pet")

Pet.delete_all()
Animal.delete_all()
Owner.delete_all()

owner1 = Owner.new({ 'name' => 'Jimmy'})
owner2 = Owner.new({ 'name' => 'Bunk'})
owner3 = Owner.new({ 'name' => 'Avon'})
owner4 = Owner.new({ 'name' => 'Omar'})
owner5 = Owner.new({ 'name' => 'Bodie'})

owner1.save()
owner2.save()
owner3.save()
owner4.save()
owner5.save()

animal1 = Animal.new({
  'name' => 'Belle',
  'type' => 'rabbit',
  'breed' => 'lop',
  'adoptable' => true,
  'admission_date' => '1/1/16',
  'image' => '/images/belle.jpg'
  })
animal2 = Animal.new({
  'name' => 'Max',
  'type' => 'rabbit',
  'breed' => 'lop',
  'adoptable' => true,
  'admission_date' => '1/1/16',
  'image' => '/images/max.jpg'
  })
animal3 = Animal.new({
  'name' => 'Stamford',
  'type' => 'dog',
  'breed' => 'pointer',
  'adoptable' => false,
  'admission_date' => '10/10/17',
  'image' => '/images/stamford.jpg'
  })
animal4 = Animal.new({
  'name' => 'Ben',
  'type' => 'dog',
  'breed' => 'german shepard',
  'adoptable' => true,
  'admission_date' => '5/11/16',
  'image' => '/images/ben.jpg'
  })
animal5 = Animal.new({
  'name' => 'Charlie',
  'type' => 'cat',
  'breed' => 'mix',
  'adoptable' => true,
  'admission_date' => '12/16/16',
  'image' => '/images/charlie.jpg'
  })
animal6 = Animal.new({
  'name' => 'Hoppy',
  'type' => 'cat',
  'breed' => 'ragdoll',
  'adoptable' => false,
  'admission_date' => '1/9/17',
  'image' => '/images/hoppy.jpg'
  })

animal1.save()
animal2.save()
animal3.save()
animal4.save()
animal5.save()
animal6.save()

pet1 = Pet.new({'owner_id' => owner1.id, 'animal_id' => animal1.id})
pet2 = Pet.new({'owner_id' => owner3.id, 'animal_id' => animal4.id})

pet1.save()
pet2.save()
