defmodule ClinicApp.Antecedent do
  use Ecto.Schema

  schema "antecedent" do
    field :type
    field :name
    field :description
  end
end
