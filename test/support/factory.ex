defmodule ClinicApp.Factory do
  use ExMachina
  use ClinicApp.JsonEncodeStrategy

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
  # TODO: ClinicalHistory
  
  def antecedent_factory do
    %ClinicApp.Antecedent{
      type: "", #TODO: Make a enum type
      name: Faker.Name.name,
      description: Faker.Company.catch_phrase
    }
  end

  def ailment_factory do
    %ClinicApp.Ailment{
      main_symptom: "Tuberculosis",
      date_of_detection: DateTime.utc_now |> DateTime.to_date,
      symptom_localization: "Rigth Arm",
      colateral_symptom: "a colateral symptom"
    }
  end

  def physical_exploration_factory do
    %ClinicApp.PhysicalExploration{
       temperature: 37.5,
       blood_pressure: 60,
       heart_rate: 60,
       breathing_frec: 30,
       observations: Faker.Company.catch_phrase
     }
  end

  def prescription_factory do
    %ClinicApp.Prescription{
      date: DateTime.utc_now |> DateTime.to_date 
    }
  end

  def prescription_detail_factory do
    %ClinicApp.PrescriptionDetail{
      quantity: 2,
      price: 300,
      description: Faker.Company.catch_phrase
    }
  end

  def specialty_factory do
    %ClinicApp.Specialty{
      name: Faker.Name.name,
      description: Faker.Company.catch_phrase,
      opening_time: Time.new(8,0,0),
      closing_time: Time.new(19,0,0),
      extension: Faker.Company.extension(3),
      price: 200.00 #TODO: in db is money type
    }
  end

  def appointment_factory do
    %ClinicApp.Appointment{
      date: DateTime.utc_now |> DateTime.to_date,
      type: 'C', #Get types of db
      status: 1 #TODO: make enums for status
    }
  end

  def study_factory do
    %ClinicApp.Study{
      date: DateTime.utc_now |> DateTime.to_date,
      type: "ultrasonido",
      diagnosis: Faker.Company.catch_phrase,
      result: Faker.Company.catch_phrase,
      indications: Faker.Company.catch_phrase,
      treatment: Faker.Company.catch_phrase
    }
  end

  # TODO: Image
  
  def drug_factory do
    %ClinicApp.Drug{
      sku: "laolsjbyut6rr",
      name: Faker.Commerce.En.product_name,
      description: Faker.Company.catch_phrase,
      purchase_price: 300.00, #TODO: money in db
      sell_price: 400.00,
      quantity: 5
    }
  end
end
