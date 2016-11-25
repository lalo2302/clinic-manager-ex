defmodule ClinicApp.Patient do
  use Ecto.Schema

  schema "patient" do
    field :name
    field :last_name
    field :date_of_birth, Ecto.Date
    field :address
    field :phone
    field :gender
    field :curp
    field :rfc
    field :email
  end
end
