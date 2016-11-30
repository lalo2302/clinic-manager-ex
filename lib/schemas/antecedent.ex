defmodule ClinicApp.Antecedent do
  use Ecto.Schema

  schema "antecedent" do
    field :name
    field :type
    field :description

    belongs_to :clinical_history, ClinicApp.ClinicalHistory
  end

end
