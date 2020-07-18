# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

PreRegistration.create!(
    cpf: '111.111.111-11',
    bloc: 1,
    ap: 101
)

User.create!(
    email: "user@user.com",
    password: 123456,
    password_confirmation: 123456,
    user_name: "John Joao",
    role: 0,
    paid: true,
    pre_registration_id: 2
)