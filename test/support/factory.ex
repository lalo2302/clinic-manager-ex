defmodule ClinicApp.Factory do
  use ExMachina.Ecto #, repo: ClinicApp.Repo

  def patient_factory do
    %ClinicApp.Patient{
      name: Faker.Name.first_name,
      last_name: Faker.Name.last_name,
      date_of_birth: DateTime.utc_now,
      gender: "M",
      curp: "AUOE960223HDFGLD00",
      rfc: "QCS931209 G49",
      address: Faker.Address.street_address,
      email: Faker.Internet.free_email,
      phone: Faker.Phone.EnUs.phone 

      # Relation with ClinicalHistory
      # Relation with User
    }
  end

  def user_factory do
    %ClinicApp.User{
      username: Faker.Internet.user_name,
      password: Faker.Lorem.characters(9)
    }
  end 

  def clinic_factory do
    %ClinicApp.Clinic{
      name: Faker.Company.name,
      address: Faker.Address.street_address,
      phone: Faker.Phone.EnUs.phone,
      manager: Faker.Name.name,
      email: Faker.Internet.free_email,
      open_time: Time.new(8,0,0),
      closing_time: Time.new(17,0,0),
      open_days: "Lun-Vie"
    }
  end

  def employee_factory do
    %ClinicApp.Employee{
      name: Faker.Name.name,
      last_name: Faker.Name.last_name,
      date_of_birth: Date.new(1996, 2, 23),
      gender: "M",
      curp: "AUOE960223HDFGLD00",
      rfc: "QCS931209 G49",
      address: Faker.Address.street_address,
      email: Faker.Internet.free_email,
      phone: Faker.Phone.EnUs.phone,
      profession: Faker.Company.bullshit,
      job: Faker.Name.title_job

      # Specialty 1
      # User 1
    }
  end
  # TODO: factories
end
