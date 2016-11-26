defmodule ClinicApp.Factory do
  use ExMachina
  use ClinicApp.JsonEncodeStrategy

  def ailment_factory do
    %ClinicApp.Ailment{
      main_symptom: "Tuberculosis",
      date_of_detection: DateTime.utc_now |> DateTime.to_date,
      symptom_location: "Rigth Arm",
      colateral_symptom: "a colateral symptom"
    }
  end

  def antecedent_factory do
    %ClinicApp.Antecedent{
      name: Faker.Name.name,
      type: "", #TODO: Make a enum type
      description: Faker.Company.catch_phrase
    }
  end

  def appointment_factory do
    %ClinicApp.Appointment{
      date: DateTime.utc_now |> DateTime.to_date,
      type: 'C', #Get types of db
      status: 1 #TODO: make enums for status
    }
  end

  def clinic_factory do
    %ClinicApp.Clinic{
      name: Faker.Company.name,
      address: Faker.Address.street_address,
      phone: Faker.Phone.EnUs.phone,
      manager: Faker.Name.name,
      #email: Faker.Internet.free_email,
      open_time: "08:00"
      close_time: "17:00"
      open_days: "Lun-Vie"
    }
  end

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

  def employee_factory do
    %ClinicApp.Employee{
      name: Faker.Name.name,
      last_name: Faker.Name.last_name,
      date_birth: Date.new(1996, 2, 23),
      address: Faker.Address.street_address,
      phone: Faker.Phone.EnUs.phone,
      profession: Faker.Company.bullshit,
      gender: "M",
      curp: "AAAA111111HAAAAAA0",
      rfc: "AAA111111111"
      email: Faker.Internet.free_email,
      job: Faker.Name.title_job

      # Specialty 1
      # User 1
    }
  end

  def patient_factory do
    %ClinicApp.Patient{
      name: Faker.Name.first_name,
      last_name: Faker.Name.last_name,
      date_of_birth: DateTime.utc_now,
      address: Faker.Address.street_address,
      phone: Faker.Phone.EnUs.phone, 
      gender: "M",
      email: Faker.Internet.free_email,
      # Relation with ClinicalHistory
      # Relation with User
    }
  end

  def with_clinical_history(patient) do
    attrs = %{clinical_history: build(:clinical_history)}
    #   params_with_assocs(patient, attrs)
  end

  def with_user(resource) do
    attrs = %{user: build(:user)}
    
    #params_with_assocs(resource, attrs)
  end

  def with_antecedents(patient) do
    clinical_history = patient.clinical_history
    #    antedecents = insert_list(2, :antecedent)
  end

  def physical_exploration_factory do
    %ClinicApp.PhysicalExploration{
       temperature: 37.5,
       blood_pressure: 60.5,
       heart_rate: 60,
       breathing_frec: 30,
       observations: Faker.Lorem.paragraphs
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
      opening_time: "08:00",
      closing_time: "15:00",
      extension: Faker.Company.extension(3),
      cost: 200.00 
    }
  end

  def study_factory do
    %ClinicApp.Study{
      date: DateTime.utc_now |> DateTime.to_date,
      diagnosis: Faker.Company.catch_phrase,
      result: Faker.Company.catch_phrase,
      indications: Faker.Company.catch_phrase,
      treatment: Faker.Company.catch_phrase
    }
  end

  def user_factory do
    %ClinicApp.User{
      username: Faker.Internet.user_name,
      password: Faker.Lorem.characters(9)
    }
  end 

  # TODO: ClinicalHistory
  
  # TODO: Image
  
end
