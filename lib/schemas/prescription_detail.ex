defmodule ClinicApp.PrescriptionDetail do
  use Ecto.Schema

  schema "prescription_detail" do
    field :quantity, :integer
    field :price, :float
    field :description
  end
end
