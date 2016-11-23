defmodule ClinicApp.Antecedent do
  use Ecto.Schema

  schema "antecedent" do
    field :name
    field :type
    field :description
  end
end
