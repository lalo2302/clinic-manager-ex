defmodule ClinicApp.Study do
  use Ecto.Schema
  import Ecto.Changeset

  schema "study" do
    field :date, Ecto.Date
    field :diagnosis
    field :result
    field :indications
    field :treatment

    belongs_to :clinical_history, ClinicApp.ClinicalHistory
    belongs_to :employee, ClinicApp.Employee

    has_many :images, ClinicApp.Image
  end

  def changeset(model, params) do
    required_params = ~w(date diagnosis result indications treatment employee_id clinical_history_id)
    changeset = cast(model, params, required_params, [])
    changeset
  end
end
