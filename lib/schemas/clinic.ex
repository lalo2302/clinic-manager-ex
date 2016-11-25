defmodule ClinicApp.Clinic do
  use Ecto.Schema

  schema "clinic" do
    field :name
    field :address
    field :phone
    field :manager
    #    field :email
    field :open_time, Ecto.Time
    field :close_time, Ecto.Time
    field :open_days
  end
end
