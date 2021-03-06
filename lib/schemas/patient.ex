defmodule ClinicApp.Patient do
  use Ecto.Schema
  import Ecto.Changeset

  schema "patient" do
    field :name
    field :last_name
    field :date_of_birth, Ecto.Date
    field :address
    field :phone
    field :gender
    field :curp
    field :rfc
    field :email

    belongs_to :user, ClinicApp.User
  
    has_one :clinical_history, ClinicApp.ClinicalHistory

    has_many :appointments, ClinicApp.Appointment
    has_many :prescriptions, ClinicApp.Prescription

    has_many :studies, through: [:clinical_history, :studies]
    has_many :antecedents, through: [:clinical_history, :antecedents]
    has_many :ailments, through: [:clinical_history, :ailments]
    has_many :physical_explorations, through: [:clinical_history, :physical_explorations]
  end

  def changeset(model, params) do
    required_params = ~w(name last_name date_of_birth address phone gender curp rfc email)
    changeset = cast(model, params, required_params)
    changeset 
  end
end
