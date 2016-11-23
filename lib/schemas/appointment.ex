defmodule ClinicApp.Appointment do
  use Ecto.Schema

  schema "appointment" do
    field :date, :date
    field :type
    field :satisfaction, :integer
    field :status, :integer
  end
end
