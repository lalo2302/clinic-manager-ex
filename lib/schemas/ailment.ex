defmodule ClinicApp.Ailment do
  use Ecto.Schema

  schema "ailment" do
    field :main_symptom
    field :date_of_detection, :date
    field :symptom_location
    field :colateral_symptom
    field :end_date, :date
  end
end
