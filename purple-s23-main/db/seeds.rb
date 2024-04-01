# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


#### User DB
admin = User.create!(
    email: 'admin@email.com',
    password: 'purple',
    role: 'admin',
    reg_done: true
)

user1 = User.create!(
    email: 'user1@email.com',
    password: 'purple',
    role: 'user',
    reg_done: true
)

user2 = User.create!(
    email: 'user2@email.com',
    password: 'purple',
    role: 'user',
    reg_done: true
)

###### Userdata DB
adminud = Userdatum.create!(
  firstname:  'John',
  lastname: 'Brown',
  emailid: 'jb@gmail.com',
  mobile:  '9898989898',
  address: 'Apt 102 Memphis 38152',
  user: admin
)

user1ud = Userdatum.create!(
  firstname:  'Peter',
  lastname: 'Ash',
  emailid: 'pa@gmail.com',
  mobile:  '9999999999',
  address: 'Apt 110 Nashville 38252',
  user: user1
)

user2ud = Userdatum.create!(
  firstname:  'Smith',
  lastname: 'Klash',
  emailid: 'sk@gmail.com',
  mobile:  '7777777777',
  address: 'Apt 290 Tennessee 31267',
  user: user2
)

###### PostsDB

post1 = Post.create!(
  title:  'Roasted Autumn Salad',
  content: 'Sweet Potatoes, Brussels Sprouts, Candied Pecans, Dried Cranberries, Grated Parmesan Cheese, Chicken Or Tofu',
  likes: 10,
  dislikes: 11,
  comments: 'Add Ranch instead of Mustard, it may be good - By User 1'
)

post2 = Post.create!(
  title:  'Cobb Salad',
  content: 'Hard Boiled Egg, Bacon, Avocado, Tomatoes, Blue Cheese Crumbles, Green Onions, Romaine, Mixed Greens, Chicken Or Tofu',
  likes: 12,
  dislikes: 12,
  comments: 'Add Parmesan before heating, it may be good - By User 2'
)

###### Payment DB
payment1 = Payment.create!(
  cardnumber: 123456789,
  cardholdername: 'John',
  expirydate: 12/12/12,
  cvv: 172,
  zipcode: 38111,
  paymentstatus: 'Success'
)

payment2 = Payment.create!(
  cardnumber: 934757578,
  cardholdername: 'Peter',
  expirydate: 11/12/11,
  cvv: 345,
  zipcode: 38121,
  paymentstatus: 'Failed'
)

###### UserVitalsAndPreferences DB
UserVitalsAndPreference.create!(
  gender:  'male',
  age: 23,
  height: 120,
  weight: 67,
  weighttobe: 50,
  isVegan: false ,
  isGlutenFree: true ,
  isAllGreens: false ,
  isAllMeats: false ,
  isTropical: false ,
  isBasics: true ,
  userdata: user1ud
    
)

UserVitalsAndPreference.create!(
  gender:  'female',
  age: 33,
  height: 154,
  weight: 82,
  weighttobe: 70,
  isVegan: false ,
  isGlutenFree: false ,
  isAllGreens: false ,
  isAllMeats: true ,
  isTropical: false ,
  isBasics: false ,
  userdata: user2ud
)


###### Salad DB
curatedsalad1 =CuratedSalad.create!(
    saladName: 'chicken salad',
    saladIngredients:'Corn, Black Beans, Pico De Gallo, Avocado, Tortilla Strips, Pepper Jack Cheese, Romaine, Mixed Greens, Chicken Or Tofu' ,
    calories:120 ,
    price_cents: 20.5 ,
    quantities:75 ,
    outOfStock: false,
    isVegan: false ,
    isAllMeat: true ,
    isAllGreens: false ,
    isTropical: true ,
    isDiaryDiet: false ,
    discount: 1.5
).salad_image.attach(io: File.open(Rails.root.join('app/assets/images/chicken.jpg')), filename: 'chicken.jpg')

curatedsalad2 =CuratedSalad.create!(
    saladName: 'Roasted Autumn Salad',
    saladIngredients:' Sweet Potatoes, Brussels Sprouts, Candied Pecans, Dried Cranberries, Grated Parmesan Cheese, Chicken or Tofu' ,
    calories:460 ,
    price_cents: 20.5 ,
    quantities:75 ,
    outOfStock:false,
    isVegan:false ,
    isAllMeat: true ,
    isAllGreens: false ,
    isTropical: true ,
    isDiaryDiet: false ,
    discount: 1.5
    
).salad_image.attach(io: File.open(Rails.root.join('app/assets/images/Roasted-Autumn.png')), filename: 'Roasted-Autumn.png')
curatedsalad3 =CuratedSalad.create!(
    saladName: 'Cobb Salad',
    saladIngredients:' Hard Boiled Egg, Bacon, Avocado, Tomatoes, Blue Cheese Crumbles, Green Onions, Romaine, Mixed Greens, Chicken or Tofu' ,
    calories:510 ,
    price_cents: 20.5 ,
    quantities:75 ,
    outOfStock:false,
    isVegan:false ,
    isAllMeat: false ,
    isAllGreens: false ,
    isTropical: true ,
    isDiaryDiet: false ,
    discount: 1.5
    
).salad_image.attach(io: File.open(Rails.root.join('app/assets/images/Cobb.png')), filename: 'Cobb.png')

curatedsalad4 =CuratedSalad.create!(
    saladName: 'Roasted Autumn Salad',
    saladIngredients:' Sweet Potatoes, Brussels Sprouts, Candied Pecans, Dried Cranberries, Grated Parmesan Cheese, Chicken or Tofu' ,
    calories:460 ,
    price_cents: 20.5 ,
    quantities:75 ,
    outOfStock:false,
    isVegan:false ,
    isAllMeat: true ,
    isAllGreens: false ,
    isTropical: true ,
    isDiaryDiet: false ,
    discount: 1.5,
        
).salad_image.attach(io: File.open(Rails.root.join('app/assets/images/Roasted-Autumn.png')), filename: 'Roasted-Autumn.png')

curatedsalad5 =CuratedSalad.create!(
    saladName: 'BBQ Ranch Salad',
    saladIngredients:' Corn, Black Beans, Pico de Gallo, Avocado, Tortilla Strips, Pepper Jack Cheese, Romaine, Mixed Greens, Chicken or Tofu' ,
    calories:400 ,
    price_cents: 22.5 ,
    quantities:75 ,
    outOfStock:false,
    isVegan:false ,
    isAllMeat: true ,
    isAllGreens: false ,
    isTropical: true ,
    isDiaryDiet: false ,
    discount: 1.5
).salad_image.attach(io: File.open(Rails.root.join('app/assets/images/BBQ-Ranch.png')), filename: 'BBQ-Ranch.png')

curatedsalad6 =CuratedSalad.create!(
    saladName: 'Buffalo Chicken Salad',
    saladIngredients:' Carrots, Celery, Jalapeños, Tomatoes, Croutons, Romaine, Buffalo Chicken' ,
    calories: 360 ,
    price_cents: 18.5 ,
    quantities:75 ,
    outOfStock:false,
    isVegan:false ,
    isAllMeat: true ,
    isAllGreens: false ,
    isTropical: true ,
    isDiaryDiet: false ,
    discount: 1.5
).salad_image.attach(io: File.open(Rails.root.join('app/assets/images/Buffalo-Chicken.png')), filename: 'Buffalo-Chicken.png')

curatedsalad7 =CuratedSalad.create!(
    saladName: 'Caesar Salad',
    saladIngredients:' Tomatoes, Parmesan Cheese, Croutons, Romaine, Chicken or Tofu' ,
    calories: 360 ,
    price_cents: 18.5 ,
    quantities:75 ,
    outOfStock:false,
    isVegan:false ,
    isAllMeat: true ,
    isAllGreens: false ,
    isTropical: true ,
    isDiaryDiet: false ,
    discount: 1.5
).salad_image.attach(io: File.open(Rails.root.join('app/assets/images/Caesar.png')), filename: 'Caesar.png')

curatedsalad8 =CuratedSalad.create!(
    saladName: 'Greek Salad',
    saladIngredients:' Cucumbers, Tomatoes, Kalamata Olives, Red Onions, Green Onions, Feta Cheese, Romaine, Mixed Greens, Chicken or Tofu' ,
    calories: 280 ,
    price_cents: 24.5 ,
    quantities:75 ,
    outOfStock:false,
    isVegan:false ,
    isAllMeat: true ,
    isAllGreens: false ,
    isTropical: true ,
    isDiaryDiet: false ,
    discount: 1.5    
).salad_image.attach(io: File.open(Rails.root.join('app/assets/images/Greek.png')), filename: 'Greek.png')

curatedsalad9 =CuratedSalad.create!(
    saladName: 'Jalapeno Ranch Salad',
    saladIngredients:' Corn, Tomatoes, Pickled Red Onions, Bacon, Pepper Jack Cheese, Romaine, Mixed Greens, Chicken or Tofu' ,
    calories: 410 ,
    price_cents: 18.5 ,
    quantities:75 ,
    outOfStock:false,
    isVegan:false ,
    isAllMeat: true ,
    isAllGreens: false ,
    isTropical: true ,
    isDiaryDiet: false ,
    discount: 1.5
    
).salad_image.attach(io: File.open(Rails.root.join('app/assets/images/Jalapeno-Ranch.png')), filename: 'Jalapeno-Ranch.png')

curatedsalad10 =CuratedSalad.create!(
    saladName: 'Thai Salad',
    saladIngredients:' Red Peppers, Carrots, Cucumbers, Red Cabbage, Romaine, Chicken or Tofu' ,
    calories: 180 ,
    price_cents: 18.5 ,
    quantities:75 ,
    outOfStock:false,
    isVegan:false ,
    isAllMeat: true ,
    isAllGreens: false ,
    isTropical: true ,
    isDiaryDiet: false ,
    discount: 1.5
    
).salad_image.attach(io: File.open(Rails.root.join('app/assets/images/Thai.png')), filename: 'Thai.png')

### User Cart database
user1cart = Usercart.create!(
    dressing_at: 'Mayo',
    userdata: user1ud
)

user2cart = Usercart.create!(
    dressing_at: 'Mayo & ranch',
    userdata: user2ud
)


### User Cart Items database
user1cartitem = UserCartItem.create!(
    price_cents: 10.20,
    quantities: 10,
    salad_name: CuratedSalad.find(2).saladName,
    salad_id: CuratedSalad.find(2).id,
    dressing: 'Mayo',
    usercart: user1cart
)

user2cartitem = UserCartItem.create!(
    price_cents: 13.20,
    quantities: 20,
    salad_name: CuratedSalad.find(3).saladName,
    salad_id: CuratedSalad.find(3).id,
    dressing: 'Ranch',
    usercart: user2cart
)



### Delivery Profile Database
user1dp1 = DeliveryProfile.create!(
    profile_name:   'Dummy Profile 1',
    dressings:  'Mayo, Ranch etc..',
    price_cents:    34.56,
    userdata: user1ud
)

user1dp2 = DeliveryProfile.create!(
    profile_name:   'Dummy Profile 2',
    dressings:  'Mustard, Ranch etc..',
    price_cents:    12.34,
    userdata: user1ud
)

user1dp3 = DeliveryProfile.create!(
    profile_name:   'Dummy Profile 3',
    dressings:  'Mayo, Ranch etc..',
    price_cents:    34.56,
    userdata:   user1ud
)

user1dp4 = DeliveryProfile.create!(
    profile_name:   'Dummy Profile 4',
    dressings:  'Mustard, Ranch etc..',
    price_cents:    12.34,
    userdata:   user1ud
)

user1dp5 = DeliveryProfile.create!(
    profile_name:   'Dummy Profile 5',
    dressings:  'Mayo, Ranch etc..',
    price_cents:    34.56,
    userdata:   user1ud
)

user1dp6 = DeliveryProfile.create!(
    profile_name:   'Dummy Profile 6',
    dressings:  'Mustard, Ranch etc..',
    price_cents:    12.34,
    userdata:   user1ud
)

user2dp1 = DeliveryProfile.create!(
    profile_name:   'Dummy Profile 6',
    dressings:  'Mustard, Ranch etc..',
    price_cents:    12.34,
    userdata:   user2ud
)

user2dp2 = DeliveryProfile.create!(
    profile_name:   'Dummy Profile 6',
    dressings:  'Mustard, Ranch etc..',
    price_cents:    12.34,
    userdata:   user2ud
)


### Delivery Profile Items Database
user1dp1dpi1 = DeliveryProfileItem.create!(
    price_cents: 12.34,
    quantity: 5,
    salad_name: CuratedSalad.find(2).saladName,
    salad_id: CuratedSalad.find(2).id,
    delivery_profiles: user1dp1
)

user1dp1dpi2 = DeliveryProfileItem.create!(
    price_cents: 12.34,
    quantity: 5,
    salad_name: CuratedSalad.find(3).saladName,
    salad_id: CuratedSalad.find(3).id,
    delivery_profiles: user1dp1
)

user1dp1dpi3 = DeliveryProfileItem.create!(
    price_cents: 12.34,
    quantity: 5,
    salad_name: CuratedSalad.find(4).saladName,
    salad_id: CuratedSalad.find(4).id,
    delivery_profiles: user1dp1
)

user1dp2dpi1 = DeliveryProfileItem.create!(
    price_cents: 12.34,
    quantity: 5,
    salad_name: CuratedSalad.find(2).saladName,
    salad_id: CuratedSalad.find(2).id,
    delivery_profiles: user1dp2
)

user1dp2dpi2 = DeliveryProfileItem.create!(
    price_cents: 12.34,
    quantity: 5,
    salad_name: CuratedSalad.find(3).saladName,
    salad_id: CuratedSalad.find(3).id,
    delivery_profiles: user1dp2
)

user1dp2dpi3 = DeliveryProfileItem.create!(
    price_cents: 12.34,
    quantity: 5,
    salad_name: CuratedSalad.find(4).saladName,
    salad_id: CuratedSalad.find(4).id,
    delivery_profiles: user1dp2
)

user1dp3dpi1 = DeliveryProfileItem.create!(
    price_cents: 12.34,
    quantity: 5,
    salad_name: CuratedSalad.find(2).saladName,
    salad_id: CuratedSalad.find(2).id,
    delivery_profiles: user1dp3
)

user1dp3dpi2 = DeliveryProfileItem.create!(
    price_cents: 12.34,
    quantity: 5,
    salad_name: CuratedSalad.find(3).saladName,
    salad_id: CuratedSalad.find(3).id,
    delivery_profiles: user1dp3
)

user1dp3dpi3 = DeliveryProfileItem.create!(
    price_cents: 12.34,
    quantity: 5,
    salad_name: CuratedSalad.find(4).saladName,
    salad_id: CuratedSalad.find(4).id,
    delivery_profiles: user1dp3
)

user1dp4dpi1 = DeliveryProfileItem.create!(
    price_cents: 12.34,
    quantity: 5,
    salad_name: CuratedSalad.find(2).saladName,
    salad_id: CuratedSalad.find(2).id,
    delivery_profiles: user1dp4
)

user1dp4dpi2 = DeliveryProfileItem.create!(
    price_cents: 12.34,
    quantity: 5,
    salad_name: CuratedSalad.find(3).saladName,
    salad_id: CuratedSalad.find(3).id,
    delivery_profiles: user1dp4
)

user1dp4dpi3 = DeliveryProfileItem.create!(
    price_cents: 12.34,
    quantity: 5,
    salad_name: CuratedSalad.find(4).saladName,
    salad_id: CuratedSalad.find(4).id,
    delivery_profiles: user1dp4
)

user1dp5dpi1 = DeliveryProfileItem.create!(
    price_cents: 12.34,
    quantity: 5,
    salad_name: CuratedSalad.find(2).saladName,
    salad_id: CuratedSalad.find(2).id,
    delivery_profiles: user1dp5
)

user1dp5dpi2 = DeliveryProfileItem.create!(
    price_cents: 12.34,
    quantity: 5,
    salad_name: CuratedSalad.find(3).saladName,
    salad_id: CuratedSalad.find(3).id,
    delivery_profiles: user1dp5
)

user1dp5dpi3 = DeliveryProfileItem.create!(
    price_cents: 12.34,
    quantity: 5,
    salad_name: CuratedSalad.find(4).saladName,
    salad_id: CuratedSalad.find(4).id,
    delivery_profiles: user1dp5
)

user1dp6dpi1 = DeliveryProfileItem.create!(
    price_cents: 12.34,
    quantity: 5,
    salad_name: CuratedSalad.find(2).saladName,
    salad_id: CuratedSalad.find(2).id,
    delivery_profiles: user1dp6
)

user1dp6dpi2 = DeliveryProfileItem.create!(
    price_cents: 12.34,
    quantity: 5,
    salad_name: CuratedSalad.find(3).saladName,
    salad_id: CuratedSalad.find(3).id,
    delivery_profiles: user1dp6
)

user1dp6dpi3 = DeliveryProfileItem.create!(
    price_cents: 12.34,
    quantity: 5,
    salad_name: CuratedSalad.find(4).saladName,
    salad_id: CuratedSalad.find(4).id,
    delivery_profiles: user1dp6
)


user2dp1dpi1 = DeliveryProfileItem.create!(
    price_cents: 12.34,
    quantity: 5,
    salad_name: CuratedSalad.find(2).saladName,
    salad_id: CuratedSalad.find(2).id,
    delivery_profiles: user2dp1
)

user2dp1dpi2 = DeliveryProfileItem.create!(
    price_cents: 12.34,
    quantity: 5,
    salad_name: CuratedSalad.find(3).saladName,
    salad_id: CuratedSalad.find(3).id,
    delivery_profiles: user2dp1
)

user2dp1dpi3 = DeliveryProfileItem.create!(
    price_cents: 12.34,
    quantity: 5,
    salad_name: CuratedSalad.find(4).saladName,
    salad_id: CuratedSalad.find(4).id,
    delivery_profiles: user2dp1
)

user2dp2dpi1 = DeliveryProfileItem.create!(
    price_cents: 12.34,
    quantity: 5,
    salad_name: CuratedSalad.find(2).saladName,
    salad_id: CuratedSalad.find(2).id,
    delivery_profiles: user2dp2
)

user2dp2dpi2 = DeliveryProfileItem.create!(
    price_cents: 12.34,
    quantity: 5,
    salad_name: CuratedSalad.find(3).saladName,
    salad_id: CuratedSalad.find(3).id,
    delivery_profiles: user2dp2
)

user2dp2dpi3 = DeliveryProfileItem.create!(
    price_cents: 12.34,
    quantity: 5,
    salad_name: CuratedSalad.find(4).saladName,
    salad_id: CuratedSalad.find(4).id,
    delivery_profiles: user2dp2
)



category1= Icategory.create!(
    itype: 'Fruits'
)
category2= Icategory.create!(
    itype: 'Vegetables'
)
category3= Icategory.create!(
    itype: 'Protein'
)
category4= Icategory.create!(
    itype: 'Dressing'
)
category5= Icategory.create!(
    itype: 'Base'
)
category6= Icategory.create!(
    itype: 'Others'
)


fruits_f1= Ingredient.create!(
    
    iname: "Pineapple",
    icalorie: 40,
    ifat: 50,
    icarbo: 20,
    iprotein: 120,
    isAllMeat: false,
    isAllGreens: true,
    isVegan: true,
    icategory: category1,
    icheck: false
)
fruits_f2= Ingredient.create!(
    iname: "Apple",
    icalorie: 41,
    ifat: 51,
    icarbo: 30,
    iprotein: 130,
    isAllMeat: false,
    isAllGreens: true,
    isVegan: true,
    icategory: category1,
    icheck: false
)
fruits_f3= Ingredient.create!(
    iname: "Grapes",
    icalorie: 40,
    ifat: 50,
    icarbo: 20,
    iprotein: 120,
    isAllMeat: false,
    isAllGreens: true,
    isVegan: true,
    icategory: category1,
    icheck: false
)
fruits_f4= Ingredient.create!(
    iname: "Banana",
    icalorie: 40,
    ifat: 50,
    icarbo: 20,
    iprotein: 120,
    isAllMeat: false,
    isAllGreens: true,
    isVegan: true,
    icategory: category1,
    icheck: false
)
fruits_f5= Ingredient.create!(
    iname: "Pineapples",
    icalorie: 20,
    ifat: 50,
    icarbo: 20,
    iprotein: 140,
    isAllMeat: false,
    isAllGreens: true,
    isVegan: true,
    icategory: category1,
    icheck: false

)
ifruits_f6= Ingredient.create!(
    iname: "Strawberries",
    icalorie: 28,
    ifat: 50,
    icarbo: 20,
    iprotein: 140,
    isAllMeat: false,
    isAllGreens: true,
    isVegan: true,
    icategory: category1,
    icheck: false

)
fruits_f7= Ingredient.create!(
    iname: "Mandarin oranges",
    icalorie: 23,
    ifat: 50,
    icarbo: 20,
    iprotein: 140,
    isAllMeat: false,
    isAllGreens: true,
    isVegan: true,
    icategory: category1,
    icheck: false

)
fruits_f8= Ingredient.create!(
    iname: "Grapes",
    icalorie: 25,
    ifat: 30,
    icarbo: 10,
    iprotein: 140,
    isAllMeat: false,
    isAllGreens: true,
    isVegan: true,
    icategory: category1,
    icheck: false

)
fruits_f9= Ingredient.create!(
    iname: "Grapes",
    icalorie: 22,
    ifat: 50,
    icarbo: 20,
    iprotein: 140,
    isAllMeat: false,
    isAllGreens: true,
    isVegan: true,
    icategory: category1,
    icheck: false

)
fruits_f10=  Ingredient.create!(
    iname: "Dried cranberries",
    icalorie: 21,
    ifat: 14,
    icarbo: 10,
    iprotein: 150,
    isAllMeat: false,
    isAllGreens: true,
    isVegan: true,
    icategory: category1,
    icheck: false

)
vegetable_v1=  Ingredient.create!(
    iname: "Black olives",
    icalorie: 21,
    ifat: 14,
    icarbo: 10,
    iprotein: 150,
    isAllMeat: false,
    isAllGreens: true,
    isVegan: true,
    icategory: category2,
    icheck: false

)
vegetable_v2=  Ingredient.create!(
    iname: "Green olives",
    icalorie: 22,
    ifat: 15,
    icarbo: 11,
    iprotein: 120,
    isAllMeat: false,
    isAllGreens: true,
    isVegan: true,
    icategory: category2,
    icheck: false

)

vegetable_v3=  Ingredient.create!(
    iname: "Jalapeños",
    icalorie: 23,
    ifat: 16,
    icarbo: 10,
    iprotein: 150,
    isAllMeat: false,
    isAllGreens: true,
    isVegan: true,
    icategory: category2,
    icheck: false

)

vegetable_v4=  Ingredient.create!(
    iname: "Banana peppers",
    icalorie: 25,
    ifat: 17,
    icarbo: 14,
    iprotein: 150,
    isAllMeat: false,
    isAllGreens: true,
    isVegan: true,
    icategory: category2,
    icheck: false

)

vegetable_v5=  Ingredient.create!(
    iname: "Avocado",
    icalorie: 26,
    ifat: 18,
    icarbo: 17,
    iprotein: 158,
    isAllMeat: false,
    isAllGreens: true,
    isVegan: true,
    icategory: category2,
    icheck: false
)

vegetable_v6=  Ingredient.create!(
    iname: "Pepperocini",
    icalorie: 27,
    ifat: 19,
    icarbo: 10,
    iprotein: 172,
    isAllMeat: false,
    isAllGreens: true,
    isVegan: true,
    icategory: category2,
    icheck: false
)

vegetable_v7=  Ingredient.create!(
    iname: "Artichoke hearts",
    icalorie: 28,
    ifat: 20,
    icarbo: 10,
    iprotein: 150,
    isAllMeat: false,
    isAllGreens: true,
    isVegan: true,
    icategory: category2,
    icheck: false
)

vegetable_v8=  Ingredient.create!(
    iname: "Carrots",
    icalorie: 29,
    ifat: 14,
    icarbo: 10,
    iprotein: 150,
    isAllMeat: false,
    isAllGreens: true,
    isVegan: true,
    icategory: category2,
    icheck: false

)

vegetable_v9=  Ingredient.create!(
    iname: "Radish",
    icalorie: 30,
    ifat: 14,
    icarbo: 10,
    iprotein: 150,
    isAllMeat: false,
    isAllGreens: true,
    isVegan: true,
    icategory: category2,
    icheck: false

)

vegetable_v10=  Ingredient.create!(
    iname: "Chick peas",
    icalorie: 31,
    ifat: 14,
    icarbo: 10,
    iprotein: 150,
    isAllMeat: false,
    isAllGreens: true,
    isVegan: true,
    icategory: category2,
    icheck: false

)

vegetable_v11=  Ingredient.create!(
    iname: "Edamame",
    icalorie: 32,
    ifat: 14,
    icarbo: 10,
    iprotein: 150,
    isAllMeat: false,
    isAllGreens: true,
    isVegan: true,
    icategory: category2,
    icheck: false

)

vegetable_v12=  Ingredient.create!(
    iname: "Bell pepper ",
    icalorie: 33,
    ifat: 14,
    icarbo: 10,
    iprotein: 150,
    isAllMeat: false,
    isAllGreens: true,
    isVegan: true,
    icategory: category2,
    icheck: false

)

vegetable_v13=  Ingredient.create!(
    iname: "Cabbage",
    icalorie: 34,
    ifat: 14,
    icarbo: 10,
    iprotein: 150,
    isAllMeat: false,
    isAllGreens: true,
    isVegan: true,
    icategory: category2,
    icheck: false

)

vegetable_v14=  Ingredient.create!(
    iname: "Sun dried tomatoes",
    icalorie: 24,
    ifat: 14,
    icarbo: 10,
    iprotein: 150,
    isAllMeat: false,
    isAllGreens: true,
    isVegan: true,
    icategory: category2,
    icheck: false

)
vegetable_v15=  Ingredient.create!(
    iname: "Mushrooms",
    icalorie: 23,
    ifat: 14,
    icarbo: 10,
    iprotein: 150,
    isAllMeat: false,
    isAllGreens: true,
    isVegan: true,
    icategory: category2,
    icheck: false

)

vegetable_v16=  Ingredient.create!(
    iname: "Broccoli",
    icalorie: 22,
    ifat: 14,
    icarbo: 10,
    iprotein: 150,
    isAllMeat: false,
    isAllGreens: true,
    isVegan: true,
    icategory: category2,
    icheck: false

)
vegetable_v17=  Ingredient.create!(
    iname: "Tomato",
    icalorie: 21,
    ifat: 14,
    icarbo: 10,
    iprotein: 150,
    isAllMeat: false,
    isAllGreens: true,
    isVegan: true,
    icategory: category2,
    icheck: false

)
vegetable_v18=  Ingredient.create!(
    iname: "Cucumber",
    icalorie: 20,
    ifat: 14,
    icarbo: 10,
    iprotein: 150,
    isAllMeat: false,
    isAllGreens: true,
    isVegan: true,
    icategory: category2,
    icheck: false

)
vegetable_v19=  Ingredient.create!(
    iname: "Jicama",
    icalorie: 23,
    ifat: 14,
    icarbo: 10,
    iprotein: 150,
    isAllMeat: false,
    isAllGreens: true,
    isVegan: true,
    icategory: category2,
    icheck: false

)
vegetable_v20=  Ingredient.create!(
    iname: "Snow peas",
    icalorie: 22,
    ifat: 14,
    icarbo: 10,
    iprotein: 150,
    isAllMeat: false,
    isAllGreens: true,
    isVegan: true,
    icategory: category2,
    icheck: false

)
vegetable_v21=  Ingredient.create!(
    iname: "Pea sprouts",
    icalorie: 21,
    ifat: 14,
    icarbo: 10,
    iprotein: 150,
    isAllMeat: false,
    isAllGreens: true,
    isVegan: true,
    icategory: category2,
    icheck: false

)
vegetable_v22=  Ingredient.create!(
    iname: "Black beans",
    icalorie: 20,
    ifat: 14,
    icarbo: 10,
    iprotein: 150,
    isAllMeat: false,
    isAllGreens: true,
    isVegan: true,
    icategory: category2,
    icheck: false
)

protein_p1=  Ingredient.create!(
    iname: "Pesto chicken",
    icalorie: 81,
    ifat: 14,
    icarbo: 10,
    iprotein: 150,
    isAllMeat: true,
    isAllGreens: false,
    isVegan: false,
    icategory: category3,
    icheck: false

)
protein_p2=  Ingredient.create!(
    iname: "Spicy chipotle chicken",
    icalorie: 82,
    ifat: 15,
    icarbo: 11,
    iprotein: 120,
    isAllMeat: true,
    isAllGreens: false,
    isVegan: false,
    icategory: category3,
    icheck: false

)

protein_p3=  Ingredient.create!(
    iname: "Shrimp",
    icalorie: 83,
    ifat: 16,
    icarbo: 10,
    iprotein: 150,
    isAllMeat: true,
    isAllGreens: false,
    isVegan: false,
    icategory: category3,
    icheck: false

)

protein_p4=  Ingredient.create!(
    iname: "Krabmeat",
    icalorie: 85,
    ifat: 17,
    icarbo: 14,
    iprotein: 150,
    isAllMeat: true,
    isAllGreens: false,
    isVegan: false,
    icategory: category3,
    icheck: false

)

protein_p5=  Ingredient.create!(
    iname: "Seafood mix",
    icalorie: 84,
    ifat: 18,
    icarbo: 17,
    iprotein: 158,
    isAllMeat: true,
    isAllGreens: false,
    isVegan: false,
    icategory: category3,
    icheck: false
)

protein_p6=  Ingredient.create!(
    iname: "Pepperocini",
    icalorie: 87,
    ifat: 19,
    icarbo: 10,
    iprotein: 172,
    isAllMeat: true,
    isAllGreens: false,
    isVegan: false,
    icategory: category3,
    icheck: false
)

protein_p7=  Ingredient.create!(
    iname: "Herb-marinated chicken",
    icalorie: 88,
    ifat: 20,
    icarbo: 10,
    iprotein: 150,
    isAllMeat: true,
    isAllGreens: false,
    isVegan: false,
    icategory: category3,
    icheck: false
)

protein_p8=  Ingredient.create!(
    iname: "Quinoa",
    icalorie: 89,
    ifat: 14,
    icarbo: 10,
    iprotein: 150,
    isAllMeat: true,
    isAllGreens: false,
    isVegan: false,
    icategory: category3,
    icheck: false

)

protein_p9=  Ingredient.create!(
    iname: "Turkey",
    icalorie: 90,
    ifat: 14,
    icarbo: 10,
    iprotein: 150,
    isAllMeat: true,
    isAllGreens: false,
    isVegan: false,
    icategory: category3,
    icheck: false

)

protein_p10=  Ingredient.create!(
    iname: "Salmon",
    icalorie: 91,
    ifat: 14,
    icarbo: 10,
    iprotein: 150,
    isAllMeat: true,
    isAllGreens: false,
    isVegan: false,
    icategory: category3,
    icheck: false

)


dressing_d1=  Ingredient.create!(
    iname: "Buttermilk Ranch",
    icalorie: 40,
    ifat: 50,
    icarbo: 20,
    iprotein: 120,
    isAllMeat: false,
    isAllGreens: true,
    isVegan: true,
    icategory: category4,
    icheck: false
)
dressing_d2=  Ingredient.create!(
    iname: "Honey Mustard",
    icalorie: 41,
    ifat: 51,
    icarbo: 30,
    iprotein: 130,
    isAllMeat: false,
    isAllGreens: true,
    isVegan: true,
    icategory: category4,
    icheck: false
)
dressing_d3=  Ingredient.create!(
    iname: "Chipotle Ranch",
    icalorie: 40,
    ifat: 50,
    icarbo: 20,
    iprotein: 120,
    isAllMeat: false,
    isAllGreens: true,
    isVegan: true,
    icategory: category4,
    icheck: false
)
dressing_d4=  Ingredient.create!(
    iname: "Lemon Vinaigrette",
    icalorie: 40,
    ifat: 50,
    icarbo: 20,
    iprotein: 120,
    isAllMeat: false,
    isAllGreens: true,
    isVegan: true,
    icategory: category4,
    icheck: false
)
dressing_d5=  Ingredient.create!(
    iname: "Fat-Free Mango",
    icalorie: 20,
    ifat: 50,
    icarbo: 20,
    iprotein: 140,
    isAllMeat: false,
    isAllGreens: true,
    isVegan: true,
    icategory: category4,
    icheck: false

)
dressing_d6=  Ingredient.create!(
    iname: "Classic Caesar",
    icalorie: 28,
    ifat: 50,
    icarbo: 20,
    iprotein: 140,
    isAllMeat: false,
    isAllGreens: true,
    isVegan: true,
    icategory: category4,
    icheck: false

)
dressing_d7=  Ingredient.create!(
    iname: "Sun Dried Tomato",
    icalorie: 23,
    ifat: 50,
    icarbo: 20,
    iprotein: 140,
    isAllMeat: false,
    isAllGreens: true,
    isVegan: true,
    icategory: category4,
    icheck: false

)
dressing_d8=  Ingredient.create!(
    iname: "Ginger Lime",
    icalorie: 25,
    ifat: 30,
    icarbo: 10,
    iprotein: 140,
    isAllMeat: false,
    isAllGreens: true,
    isVegan: true,
    icategory: category4,
    icheck: false

)
dressing_d9=  Ingredient.create!(
    iname: "Jalapeño Avocado",
    icalorie: 22,
    ifat: 50,
    icarbo: 20,
    iprotein: 140,
    isAllMeat: false,
    isAllGreens: true,
    isVegan: true,
    icategory: category4,
    icheck: false

)
dressing_d10=  Ingredient.create!(
    iname: "Balsamic Vinegar",
    icalorie: 21,
    ifat: 14,
    icarbo: 10,
    iprotein: 150,
    isAllMeat: false,
    isAllGreens: true,
    isVegan: true,
    icategory: category4,
    icheck: false

)
dressing_d11=  Ingredient.create!(
    iname: "Olive Oil",
    icalorie: 21,
    ifat: 14,
    icarbo: 10,
    iprotein: 150,
    isAllMeat: false,
    isAllGreens: true,
    isVegan: true,
    icategory: category4,
    icheck: false

)
dressing_d12=  Ingredient.create!(
    iname: "Fresh Herb Vinaigrette",
    icalorie: 21,
    ifat: 14,
    icarbo: 10,
    iprotein: 150,
    isAllMeat: false,
    isAllGreens: true,
    isVegan: true,
    icategory: category4,
    icheck: false

)

base_b1=  Ingredient.create!(
    iname: "Salata mix",
    icalorie: 40,
    ifat: 50,
    icarbo: 20,
    iprotein: 120,
    isAllMeat: false,
    isAllGreens: true,
    isVegan: true,
    icategory: category5,
    icheck: false
)
base_b2=  Ingredient.create!(
    iname: "Romaine hearts",
    icalorie: 41,
    ifat: 51,
    icarbo: 30,
    iprotein: 130,
    isAllMeat: false,
    isAllGreens: true,
    isVegan: true,
    icategory: category5,
    icheck: false
)
base_b3=  Ingredient.create!(
    iname: "Arcadian mix",
    icalorie: 40,
    ifat: 50,
    icarbo: 20,
    iprotein: 120,
    isAllMeat: false,
    isAllGreens: true,
    isVegan: true,
    icategory: category5,
    icheck: false
)
base_b4=  Ingredient.create!(
    iname: "Spinach",
    icalorie: 40,
    ifat: 50,
    icarbo: 20,
    iprotein: 120,
    isAllMeat: false,
    isAllGreens: true,
    isVegan: true,
    icategory: category5,
    icheck: false
)
base_b5=  Ingredient.create!(
    iname: "Kale",
    icalorie: 20,
    ifat: 50,
    icarbo: 20,
    iprotein: 140,
    isAllMeat: false,
    isAllGreens: true,
    isVegan: true,
    icategory: category5,
    icheck: false

)
base_b6=  Ingredient.create!(
    iname: "Arugula",
    icalorie: 28,
    ifat: 50,
    icarbo: 20,
    iprotein: 140,
    isAllMeat: false,
    isAllGreens: true,
    isVegan: true,
    icategory: category5,
    icheck: false

)



others_o1=  Ingredient.create!(
    iname: "Whole wheat tortilla",
    icalorie: 81,
    ifat: 14,
    icarbo: 10,
    iprotein: 150,
    isAllMeat: false,
    isAllGreens: false,
    isVegan: true,
    icategory: category6,
    icheck: false

)
others_o2=  Ingredient.create!(
    iname: "Southwestern tortilla",
    icalorie: 82,
    ifat: 15,
    icarbo: 11,
    iprotein: 120,
    isAllMeat: false,
    isAllGreens: false,
    isVegan: true,
    icategory: category6,
    icheck: false

)

others_o3=  Ingredient.create!(
    iname: "cool cucumber tortilla",
    icalorie: 83,
    ifat: 16,
    icarbo: 10,
    iprotein: 150,
    isAllMeat: false,
    isAllGreens: false,
    isVegan: true,
    icategory: category6,
    icheck: false

)

others_o4=  Ingredient.create!(
    iname: "Sesame sticks",
    icalorie: 85,
    ifat: 17,
    icarbo: 14,
    iprotein: 150,
    isAllMeat: false,
    isAllGreens: false,
    isVegan: true,
    icategory: category6,
    icheck: false

)

others_o5=  Ingredient.create!(
    iname: "Multigrain croissant",
    icalorie: 84,
    ifat: 18,
    icarbo: 17,
    iprotein: 158,
    isAllMeat: false,
    isAllGreens: false,
    isVegan: true,
    icategory: category6,
    icheck: false
)

others_o6=  Ingredient.create!(
    iname: "Texas BBQ tortilla",
    icalorie: 87,
    ifat: 19,
    icarbo: 10,
    iprotein: 172,
    isAllMeat: false,
    isAllGreens: false,
    isVegan: true,
    icategory: category6,
    icheck: false
)

others_o7=  Ingredient.create!(
    iname: "Pasta",
    icalorie: 88,
    ifat: 20,
    icarbo: 10,
    iprotein: 150,
    isAllMeat: true,
    isAllGreens: false,
    isVegan: false,
    icategory: category6,
    icheck: false
)

others_o8=  Ingredient.create!(
    iname: "Chopped bacon",
    icalorie: 89,
    ifat: 14,
    icarbo: 10,
    iprotein: 150,
    isAllMeat: true,
    isAllGreens: false,
    isVegan: false,
    icategory: category6,
    icheck: false
)

others_o9=  Ingredient.create!(
    iname: "Chopped egg",
    icalorie: 90,
    ifat: 14,
    icarbo: 10,
    iprotein: 150,
    isAllMeat: true,
    isAllGreens: false,
    isVegan: false,
    icategory: category6,
    icheck: false
)

others_o10=  Ingredient.create!(
    iname: "Thai ginger tortilla",
    icalorie: 91,
    ifat: 14,
    icarbo: 10,
    iprotein: 150,
    isAllMeat: false,
    isAllGreens: false,
    isVegan: true,
    icategory: category6,
    icheck: false
)

















  

  

  

 



  

  

  





