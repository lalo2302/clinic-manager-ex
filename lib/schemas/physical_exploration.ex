defmodule ClinicApp.PhysicalExploration do
  use Ecto.Schema

  schema "physical_exploration" do
    field :temperature, :float
    field :blood_pressure, :float
    field :heart_rate, :integer
    field :breathing_frec, :integer
    field :observations

    belongs_to :clinical_history, ClinicApp.ClinicalHistory
  end
end
