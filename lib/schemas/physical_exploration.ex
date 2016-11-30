defmodule ClinicApp.PhysicalExploration do
  use Ecto.Schema

  schema "PhysicalExploration" do
    field :temperature, :float
    field :blood_pressure, :float
    field :heart_rate, :integer
    field :breathing_frec, :integer
    field :observations

    timestamps

    belongs_to :clinical_history, ClinicApp.ClinicalHistory
  end
end
