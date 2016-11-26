defmodule ClinicApp.Prescription do
  use Ecto.Schema

  schema "prescription" do
    field :date, Ecto.Date

    belongs_to :patient, ClinicApp.Patient
    belongs_to :employee, ClinicApp.Employee

    has_many :prescription_details, ClinicApp.PrescriptionDetail
  end
end
