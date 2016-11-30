defmodule ClinicApp.Employee do
  use Ecto.Schema

  schema "employee" do
    field :name
    field :last_name
    field :date_birth, Ecto.Date
    field :address
    field :phone
    field :profession
    field :gender
    field :curp
    field :rfc
    field :email
    field :job
    #TODO: se quedará con profesión, el nivel se guarda en el usuario 

    belongs_to :user, ClinicApp.User
    belongs_to :specialty, ClinicApp.Specialty

    has_many :appointments, ClinicApp.Appointment
    has_many :prescriptions, ClinicApp.Prescription
    has_many :studies, ClinicApp.Study
  end
end
