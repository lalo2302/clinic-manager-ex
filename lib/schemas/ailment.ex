defmodule ClinicApp.Ailment do
  use Ecto.Schema

  schema "ailment" do
    field :main_symptom
    field :date_of_detection, Ecto.Date
    field :symptom_location
    field :colateral_symptom
    field :end_date, Ecto.Date

    belongs_to :clinical_history, ClinicApp.ClinicalHistory
  end
end
