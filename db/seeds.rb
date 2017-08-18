# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

u = User.create(
  password: 'testTEST',
  created_at: DateTime.now,
  updated_at: DateTime.now
)

p = Profile.create(
  name: 'Justin Drew',
  email: 'justin@justindrew.net',
  user_id: u.id,
  created_at: DateTime.now,
  updated_at: DateTime.now
)

citP = ContactInfoType.create(
  name: 'Mobile',
  description: 'Mobile telephone number',
  phone_only: true
)

citA = ContactInfoType.create(
  name: 'Home',
  description: '',
  phone_only: false
)

Address.create(
  address: '4 E Road-place Boulevard',
  city: 'Anytown',
  state: 'CO',
  zip_code: '55555',
  contact_info_type_id: citA.id,
  profile_id: p.id,
  is_primary: true
)

PhoneNumber.create(
  country_code: '1',
  area_code: '555',
  prefix: '555',
  subscriber_number: '5555',
  contact_info_type_id: citP.id,
  profile_id: p.id,
  is_primary: true
)

Image.create(
  file_name: 'me.jpg',
  url: 'http://justindrew.net/imgs/me.jpg',
  imageable_type: 'Profile',
  imageable_id: p.id,
  uploader_id: p.id
)

AccountType.create(
  is_debt: false,
  name: 'Checking',
  require_routing_number: true
)

AccountType.create(
  is_debt: false,
  name: 'Savings',
  require_routing_number: true
)

AccountType.create(
  description: 'Auto, mortgage, student, other monthly loans',
  is_debt: true,
  name: 'Installment Loan',
  require_routing_number: false
)

AccountType.create(
  description: 'Any credit card with a monthly payment',
  is_debt: true,
  name: 'Revolving Credit',
  require_routing_number: false
)

AccountType.create(
  description: 'Any credit card requiring full payoff each month',
  is_debt: true,
  name: 'Open Credit',
  require_routing_number: false
)
