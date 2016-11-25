defmodule ClinicApp.Specialty do
  use Ecto.Schema

  schema "specialty" do
    field :name
    field :description
    field :opening_time, Ecto.Time
    field :closing_time, Ecto.Time
    field :extension
    field :cost, :float
  end
end
