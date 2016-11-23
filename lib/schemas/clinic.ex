defmodule ClinicApp.Clinic do
  use Ecto.Schema

  schema "clinic" do
    field :name
    field :address
    field :phone
    field :manager
    field :email
    field :open_time, :time
    field :closing_time, :time
    field :open_days
  end
end
