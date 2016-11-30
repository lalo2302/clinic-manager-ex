defmodule ClinicApp.Ailment do
  use Ecto.Schema
  import Ecto.Changeset

  schema "ailment" do
    field :main_symptom
    field :date_of_detection, Ecto.Date
    field :symptom_location
    field :colateral_symptom
    field :end_date, Ecto.Date

    belongs_to :clinical_history, ClinicApp.ClinicalHistory
    has_one :patient, through: [:clinical_history, :patient]
  end

  @requeried_fields ~w( main_symptom date_of_detection symptom_location colateral_symptom)
  @optional_fields ~w(end_date)

  def insert_changeset(model, params \\ :empty) do
   model
  |> cast(params, @required_fields, @optional_fields)
  |> validate_format(:date_of_detection, ~r/\d{4}[-]?[0|1]\d[-][0-3]\d/)
  end
end
