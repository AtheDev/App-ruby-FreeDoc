# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Doctor.destroy_all
Doctor.reset_pk_sequence
Patient.destroy_all
Patient.reset_pk_sequence
Appointment.destroy_all
Appointment.reset_pk_sequence
City.destroy_all
City.reset_pk_sequence
Specialty.destroy_all
Specialty.reset_pk_sequence
DealWithIt.destroy_all
DealWithIt.reset_pk_sequence

require 'faker'

the_speciality = ['Cardilogue','Généraliste','Dentiste','Pneumologue', 'Médécin du sport', 'Gynécologue', 'Neuro-Chirurgien(ne)', 'psychiatre', 'Oncologue', 'Ophthalmologue', 'Urologue', 'Neuroradiologue', 'Radiologue']

the_speciality.each do |index|
  Specialty.create(specialty_name: index)
end

10.times do
  Doctor.create(
    first_name: Faker::Name.first_name, 
    last_name: Faker::Name.last_name ,  
    zip_code: Faker::Number.number(digits: 5))
end

20.times do
  Patient.create(
    first_name: Faker::Name.first_name, 
    last_name: Faker::Name.last_name)
end

10.times do
  City.create(city_name: Faker::Address.city)
end

30.times do
  Appointment.create(
    date: Faker::Time.between(from: DateTime.now, to: DateTime.now + 30, format: :default), 
    doctor_id: Faker::Number.between(from:1, to:10), 
    patient_id: Faker::Number.between(from:1, to:20), 
    city_id: Faker::Number.between(from:1, to:10))
end

10.times do
  City.create(city_name: Faker::Address.city)
end


30.times do 
  DealWithIt.create(
    doctor_id: Faker::Number.between(from:1, to:10),
    specialty_id: Faker::Number.between(from:1, to:13))
end