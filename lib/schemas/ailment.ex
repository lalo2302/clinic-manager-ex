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

  @optional_fields ~w(end_date)

  def insert_changeset(model, params) do
    requered_params = 
    changeset = cast(model, params, ~w(main_symptom date_of_detection symptom_location colateral_symptom clinical_history_id), @optional_fields)
    changeset
  end
end
