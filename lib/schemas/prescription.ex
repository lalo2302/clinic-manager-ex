defmodule ClinicApp.Prescription do
  use Ecto.Schema

  schema "prescription" do
    field :date, Ecto.Date
  end
end
