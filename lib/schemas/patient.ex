defmodule ClinicApp.Patient do
  use Ecto.Schema

  schema "patient" do
    field :name
    field :last_name
    field :date_of_birth, :date
    field :gender
    field :curp
    field :rfc
    field :address
    field :email
    field :phone
  end
end
