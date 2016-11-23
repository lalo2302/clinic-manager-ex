defmodule ClinicApp.Employee do
  use Ecto.Schema

  schema "employee" do
    field :name
    field :last_name
    field :date_birth, :date
    field :address
    field :phone
    field :profession
    field :gender
    field :curp
    field :rfc
    field :email
    field :job
  end
end
