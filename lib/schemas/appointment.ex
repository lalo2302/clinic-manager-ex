defmodule ClinicApp.Appointment do
  use Ecto.Schema
  import Ecto.Changeset

  schema "appointment" do
    field :date, Ecto.DateTime
    field :type
    field :satisfaction, :integer
    field :status, :integer

    belongs_to :patient, ClinicApp.Patient
    belongs_to :employee, ClinicApp.Employee
  end

  def changeset(model, params) do
    required_params = ~w(date type patient_id employee_id)
    changeset = cast(model, params, required_params)
    changeset = put_change(changeset, :status, 0)
    changeset
  end
end
