defmodule ClinicApp.Specialty do
  use Ecto.Schema

  schema "specialty" do
    field :name
    field :description
    field :opening_time, :time
    field :closing_time, :time
    field :extension
    field :price, :float
  end
end
