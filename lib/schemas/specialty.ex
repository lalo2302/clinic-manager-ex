defmodule ClinicApp.Specialty do
  use Ecto.Schema

  schema "specialty" do
    field :name
    field :description
    field :opening_time
    field :closing_time
    field :extension
    field :cost, :float
    field :manager

    has_many :employees, ClinicApp.Employee
  end
end
