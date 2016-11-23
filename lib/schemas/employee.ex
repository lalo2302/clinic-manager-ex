defmodule ClinicApp.Employee do
  use Ecto.Schema

  schema "employee" do
    field :name
    field :last_name
    field :date_of_birth, :date
    field :gender
    field :curp
    field :rfc
    field :address
    field :email
    field :phone
    field :profession
    field :job
  end
end
