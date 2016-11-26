defmodule ClinicApp.User do
  use Ecto.Schema

  schema "user" do
    field :username
    field :password
    field :level

    has_one :patient, ClinicApp.Patient
    has_one :employee, ClinicApp.User
  end
end
