defmodule ClinicApp.Appointment do
  use Ecto.Schema

  schema "appointment" do
    field :date, Ecto.Date
    field :type
    field :satisfaction, :integer
    field :status, :integer

    belongs_to :patient, ClinicApp.Patient
    belongs_to :employee, ClinicApp.Employee
  end
end
