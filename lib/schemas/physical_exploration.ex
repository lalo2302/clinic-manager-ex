defmodule ClinicApp.PhysicalExploration do
  use Ecto.Schema
  import Ecto.Changeset

  schema "PhysicalExploration" do
    field :temperature, :float
    field :blood_pressure, :float
    field :heart_rate, :integer
    field :breathing_frec, :integer
    field :observations

    timestamps

    belongs_to :clinical_history, ClinicApp.ClinicalHistory
  end

  def changeset(model, params) do
    required_params = ~w(temperature blood_pressure heart_rate breathing_frec observations clinical_history_id)
    changeset = cast(model, params, required_params, [])
    changeset
  end
end
