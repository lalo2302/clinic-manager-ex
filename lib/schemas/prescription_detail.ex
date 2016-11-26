defmodule ClinicApp.PrescriptionDetail do
  use Ecto.Schema

  schema "prescription_detail" do
    field :quantity, :integer
    field :price, :float
    field :description

    belongs_to :prescription, ClinicApp.Prescription
    belongs_to :drug, ClinicApp.Drug
  end
end
