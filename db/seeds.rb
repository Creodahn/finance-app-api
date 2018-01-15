# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
TransactionType.create(
  is_debit: true,
  name: 'Debit',
  created_at: DateTime.now,
  updated_at: DateTime.now
)

TransactionType.create(
  is_debit: false,
  name: 'Credit',
  created_at: DateTime.now,
  updated_at: DateTime.now
)

u = User.create(
  password: 'testTEST',
  created_at: DateTime.now,
  updated_at: DateTime.now
)

u2 = User.create(
  password: 'test',
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

p2 = Profile.create(
  name: 'Test User',
  email: 'test@test.com',
  user_id: u2.id,
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

ContactInfoType.create(
  name: 'Work',
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
  url: 'https://cdn.filestackcontent.com/Bkz2iuRkS66opHC4RMbT',
  imageable_type: 'Profile',
  imageable_id: p.id,
  uploader_id: p.id
)

AccountType.create(
  description: 'A debit account',
  is_debt: false,
  name: 'Checking',
  require_routing_number: true
)

AccountType.create(
  description: 'A bank account that earns interest',
  is_debt: false,
  name: 'Savings',
  require_routing_number: true
)

AccountType.create(
  description: 'Auto, mortgage, student, or other monthly loans',
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

at = AccountType.create(
  description: 'An account with a utility or service provider',
  is_debt: true,
  name: 'Service Account',
  require_routing_number: false
)

g = Group.create(
  name: 'Test Group'
)

Membership.create(
  group_id: g.id,
  profile_id: p.id
)

Membership.create(
  group_id: g.id,
  profile_id: p2.id
)

Account.create(
  account_number: '100',
  account_type_id: at.id,
  balance: 0,
  description: 'Monthly payment to Netflix',
  group_id: g.id,
  name: 'Netflix',
  profile_id: p.id
)
