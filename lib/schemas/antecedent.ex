defmodule ClinicApp.Antecedent do
  use Ecto.Schema
  import Ecto.Changeset

  schema "antecedent" do
    field :name
    field :type
    field :description

    belongs_to :clinical_history, ClinicApp.ClinicalHistory
  end

  @required_params ~w(name description clinical_history_id type)

  def changeset(model, params) do
    model
    |> cast(params, @required_params)
  end
end
