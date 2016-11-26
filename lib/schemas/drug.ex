defmodule ClinicApp.Drug do
  use Ecto.Schema

  schema "drug" do
    field :sku
    field :name
    field :description
    field :purchase_price, :float
    field :sell_price, :float
    field :quantity, :integer

    has_many :prescription_details, ClinicApp.PrescriptionDetail 
  end
end
